#include <unistd.h>

#include <cstdio>
#include <iostream>

#include "cbl/CouchbaseLite.h"
#include "fleece/Fleece.h"

auto dbFile = "./build/MyDb";

CBLError error;
CBLDatabase *db;
CBLReplicator *replicator;

void printError() {
  auto message = CBLError_Message(&error);
  std::cout << "CBLError: " << message << std::endl;
  free(message);
}

void fatalError() {
  printError();
  exit(1);
}

void deleteDatabase() {
  if (!CBL_DeleteDatabase(dbFile, nullptr, &error) && error.code != 0)
    fatalError();
}

void openDatabase() {
  db = CBLDatabase_Open(dbFile, nullptr, &error);
  if (db == nullptr) fatalError();
}

void createReplicator() {
  auto endpoint = CBLEndpoint_NewWithURL("ws://localhost:4984/db");
  CBLReplicatorConfiguration replicatorConfig = {
      .database = db,
      .endpoint = endpoint,
      .replicatorType = kCBLReplicatorTypePushAndPull,
      .continuous = true,
  };

  replicator = CBLReplicator_New(&replicatorConfig, &error);
  if (replicator == nullptr) fatalError();
  CBLEndpoint_Free(endpoint);
}

void waitUntilReplicatorIsIdle() {
  printf("Waiting until replicator is idle...\n");
  while (CBLReplicator_Status(replicator).activity != kCBLReplicatorIdle) {
    usleep(1);
  }
  printf("Replicator is idle\n");
}

void cleanUpReplicator() { CBLReplicator_Release(replicator); }

void cleanUpDatabase() {
  if (!CBLDatabase_Close(db, &error)) fatalError();
  CBLDatabase_Release(db);
}

void wait() {
  auto s = 1;
  printf("Waiting for %ds\n", s);
  sleep(s);
}

int main() {
  deleteDatabase();
  openDatabase();
  createReplicator();

  CBLReplicator_Start(replicator);
  printf("Started Replicator\n");

  // Comment out this line to trigger the segmentation fault.
  wait();

  CBLReplicator_Stop(replicator);
  printf("Stopped Replicator\n");

  wait();

  cleanUpReplicator();
  cleanUpDatabase();
  printf("Cleaned up\n");

  wait();

  return 0;
}
