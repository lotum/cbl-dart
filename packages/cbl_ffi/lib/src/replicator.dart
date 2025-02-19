// ignore: lines_longer_than_80_chars
// ignore_for_file: cast_nullable_to_non_nullable,avoid_redundant_argument_values

import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'async_callback.dart';
import 'base.dart';
import 'bindings.dart';
import 'data.dart';
import 'database.dart';
import 'document.dart';
import 'fleece.dart';
import 'global.dart';
import 'utils.dart';

// === ReplicatorConfiguration =================================================

class CBLEndpoint extends Opaque {}

typedef _CBLEndpoint_CreateWithURL = Pointer<CBLEndpoint> Function(
  FLString url,
  Pointer<CBLError> errorOut,
);

typedef _CBLDart_CBLEndpoint_CreateWithLocalDB = Pointer<CBLEndpoint> Function(
  Pointer<CBLDatabase> database,
);

typedef _CBLEndpoint_Free_C = Void Function(
  Pointer<CBLEndpoint> endpoint,
);
typedef _CBLEndpoint_Free = void Function(
  Pointer<CBLEndpoint> endpoint,
);

class CBLAuthenticator extends Opaque {}

typedef _CBLAuth_CreatePassword = Pointer<CBLAuthenticator> Function(
  FLString username,
  FLString password,
);

typedef _CBLAuth_CreateSession = Pointer<CBLAuthenticator> Function(
  FLString sessionID,
  FLString cookieName,
);

typedef _CBLAuth_Free_C = Void Function(
  Pointer<CBLAuthenticator> authenticator,
);
typedef _CBLAuth_Free = void Function(
  Pointer<CBLAuthenticator> authenticator,
);

enum CBLReplicatorType {
  pushAndPull,
  push,
  pull,
}

extension on CBLReplicatorType {
  int toInt() => CBLReplicatorType.values.indexOf(this);
}

enum CBLProxyType {
  http,
  https,
}

extension on CBLProxyType {
  int toInt() => CBLProxyType.values.indexOf(this);
}

class _CBLProxySettings extends Struct {
  @Uint8()
  // ignore: unused_field
  external int _type;
  external FLString hostname;
  @Uint16()
  external int port;
  external FLString username;
  external FLString password;
}

// ignore: camel_case_extensions
extension on _CBLProxySettings {
  set type(CBLProxyType value) => _type = value.toInt();
}

class CBLProxySettings {
  CBLProxySettings({
    required this.type,
    required this.hostname,
    required this.port,
    this.username,
    required this.password,
  });

  final CBLProxyType type;
  final String hostname;
  final int port;
  final String? username;
  final String password;
}

class _CBLDartReplicatorConfiguration extends Struct {
  external Pointer<CBLDatabase> database;
  external Pointer<CBLEndpoint> endpoint;
  @Uint8()
  // ignore: unused_field
  external int _replicatorType;
  @Bool()
  external bool continuous;
  @Bool()
  external bool disableAutoPurge;
  @UnsignedInt()
  external int maxAttempts;
  @UnsignedInt()
  external int maxAttemptWaitTime;
  @UnsignedInt()
  external int heartbeat;
  external Pointer<CBLAuthenticator> authenticator;
  external Pointer<_CBLProxySettings> proxy;
  external Pointer<FLDict> headers;
  external Pointer<FLSlice> pinnedServerCertificate;
  external Pointer<FLSlice> trustedRootCertificates;
  external Pointer<FLArray> channels;
  external Pointer<FLArray> documentIDs;
  external Pointer<CBLDartAsyncCallback> pushFilter;
  external Pointer<CBLDartAsyncCallback> pullFilter;
  external Pointer<CBLDartAsyncCallback> conflictResolver;
}

extension on _CBLDartReplicatorConfiguration {
  set replicatorType(CBLReplicatorType value) =>
      _replicatorType = value.toInt();
}

class CBLReplicatorConfiguration {
  CBLReplicatorConfiguration({
    required this.database,
    required this.endpoint,
    required this.replicatorType,
    required this.continuous,
    this.disableAutoPurge,
    this.maxAttempts,
    this.maxAttemptWaitTime,
    this.heartbeat,
    this.authenticator,
    this.proxy,
    this.headers,
    this.pinnedServerCertificate,
    this.trustedRootCertificates,
    this.channels,
    this.documentIDs,
    this.pushFilter,
    this.pullFilter,
    this.conflictResolver,
  });

  final Pointer<CBLDatabase> database;
  final Pointer<CBLEndpoint> endpoint;
  final CBLReplicatorType replicatorType;
  final bool continuous;
  final bool? disableAutoPurge;
  final int? maxAttempts;
  final int? maxAttemptWaitTime;
  final int? heartbeat;
  final Pointer<CBLAuthenticator>? authenticator;
  final CBLProxySettings? proxy;
  final Pointer<FLDict>? headers;
  final Data? pinnedServerCertificate;
  final Data? trustedRootCertificates;
  final Pointer<FLArray>? channels;
  final Pointer<FLArray>? documentIDs;
  final Pointer<CBLDartAsyncCallback>? pushFilter;
  final Pointer<CBLDartAsyncCallback>? pullFilter;
  final Pointer<CBLDartAsyncCallback>? conflictResolver;
}

class ReplicationFilterCallbackMessage {
  ReplicationFilterCallbackMessage(this.document, this.flags);

  ReplicationFilterCallbackMessage.fromArguments(List<Object?> arguments)
      : this(
          (arguments[0] as int).toPointer(),
          CBLReplicatedDocumentFlag._parseCFlags(arguments[1] as int),
        );

  final Pointer<CBLDocument> document;
  final Set<CBLReplicatedDocumentFlag> flags;
}

class ReplicationConflictResolverCallbackMessage {
  ReplicationConflictResolverCallbackMessage(
    this.documentId,
    this.localDocument,
    this.remoteDocument,
  );

  ReplicationConflictResolverCallbackMessage.fromArguments(
    List<Object?> arguments,
  ) : this(
          utf8.decode(arguments[0] as Uint8List),
          (arguments[1] as int?)?.toPointer(),
          (arguments[2] as int?)?.toPointer(),
        );

  final String documentId;
  final Pointer<CBLDocument>? localDocument;
  final Pointer<CBLDocument>? remoteDocument;
}

// === Replicator ==============================================================

class CBLReplicator extends Opaque {}

typedef _CBLDart_CBLReplicator_Create = Pointer<CBLReplicator> Function(
  Pointer<_CBLDartReplicatorConfiguration> config,
  Pointer<CBLError> errorOut,
);

typedef _CBLDart_CBLReplicator_Release_C = Void Function(
  Pointer<CBLReplicator> replicator,
);

typedef _CBLReplicator_Start_C = Void Function(
  Pointer<CBLReplicator> replicator,
  Bool resetCheckpoint,
);
typedef _CBLReplicator_Start = void Function(
  Pointer<CBLReplicator> replicator,
  bool resetCheckpoint,
);

typedef _CBLReplicator_Stop_C = Void Function(
  Pointer<CBLReplicator> replicator,
);
typedef _CBLReplicator_Stop = void Function(
  Pointer<CBLReplicator> replicator,
);

typedef _CBLReplicator_SetHostReachable_C = Void Function(
  Pointer<CBLReplicator> replicator,
  Bool reachable,
);
typedef _CBLReplicator_SetHostReachable = void Function(
  Pointer<CBLReplicator> replicator,
  bool reachable,
);

typedef _CBLReplicator_SetSuspended_C = Void Function(
  Pointer<CBLReplicator> replicator,
  Bool suspended,
);
typedef _CBLReplicator_SetSuspended = void Function(
  Pointer<CBLReplicator> replicator,
  bool suspended,
);

// === Status and Progress =====================================================

enum CBLReplicatorActivityLevel {
  stopped,
  offline,
  connecting,
  idle,
  busy,
}

extension on int {
  CBLReplicatorActivityLevel toReplicatorActivityLevel() =>
      CBLReplicatorActivityLevel.values[this];
}

class _CBLReplicatorProgress extends Struct {
  @Float()
  external double complete;

  @Uint64()
  external int documentCount;
}

class _CBLReplicatorStatus extends Struct {
  @Uint8()
  external int _activity;

  external _CBLReplicatorProgress progress;

  external CBLError _error;
}

class CBLReplicatorStatus {
  CBLReplicatorStatus(
    this.activity,
    this.progressComplete,
    this.progressDocumentCount,
    this.error,
  );

  final CBLReplicatorActivityLevel activity;
  final double progressComplete;
  final int progressDocumentCount;
  final CBLErrorException? error;
}

extension on _CBLReplicatorStatus {
  CBLErrorException? get exception {
    if (!_error.isOk) {
      _error.copyToGlobal();
      return CBLErrorException.fromCBLError(globalCBLError);
    }
    return null;
  }

  CBLReplicatorStatus toCBLReplicatorStatus() => CBLReplicatorStatus(
        _activity.toReplicatorActivityLevel(),
        progress.complete,
        progress.documentCount,
        exception,
      );
}

typedef _CBLReplicator_Status = _CBLReplicatorStatus Function(
  Pointer<CBLReplicator> replicator,
);

typedef _CBLReplicator_PendingDocumentIDs = Pointer<FLDict> Function(
  Pointer<CBLReplicator> replicator,
  Pointer<CBLError> errorOut,
);

typedef _CBLReplicator_IsDocumentPending_C = Bool Function(
  Pointer<CBLReplicator> replicator,
  FLString docID,
  Pointer<CBLError> errorOut,
);
typedef _CBLReplicator_IsDocumentPending = bool Function(
  Pointer<CBLReplicator> replicator,
  FLString docID,
  Pointer<CBLError> errorOut,
);

typedef _CBLDart_CBLReplicator_AddChangeListener_C = Void Function(
  Pointer<CBLDatabase> db,
  Pointer<CBLReplicator> replicator,
  Pointer<CBLDartAsyncCallback> listener,
);
typedef _CBLDart_CBLReplicator_AddChangeListener = void Function(
  Pointer<CBLDatabase> db,
  Pointer<CBLReplicator> replicator,
  Pointer<CBLDartAsyncCallback> listener,
);

enum CBLReplicatedDocumentFlag implements Option {
  deleted(0),
  accessRemoved(1);

  const CBLReplicatedDocumentFlag(this.bit);

  @override
  final int bit;

  static Set<CBLReplicatedDocumentFlag> _parseCFlags(int flag) =>
      values.parseCFlags(flag);
}

typedef _CBLDart_CBLReplicator_AddDocumentReplicationListener_C = Void Function(
  Pointer<CBLDatabase> db,
  Pointer<CBLReplicator> replicator,
  Pointer<CBLDartAsyncCallback> listener,
);
typedef _CBLDart_CBLReplicator_AddDocumentReplicationListener = void Function(
  Pointer<CBLDatabase> db,
  Pointer<CBLReplicator> replicator,
  Pointer<CBLDartAsyncCallback> listener,
);

class ReplicatorStatusCallbackMessage {
  ReplicatorStatusCallbackMessage(this.status);

  ReplicatorStatusCallbackMessage.fromArguments(List<Object?> arguments)
      : this(parseArguments(arguments[0] as List<Object?>));

  static CBLReplicatorStatus parseArguments(List<Object?> status) {
    CBLErrorException? error;
    if (status.length > 3) {
      final domain = (status[3] as int).toErrorDomain();
      final errorCode = (status[4] as int).toErrorCode(domain);
      final message = utf8.decode(status[5] as Uint8List, allowMalformed: true);
      error = CBLErrorException(domain, errorCode, message);
    }

    return CBLReplicatorStatus(
      (status[0] as int).toReplicatorActivityLevel(),
      status[1] as double,
      status[2] as int,
      error,
    );
  }

  final CBLReplicatorStatus status;
}

class CBLReplicatedDocument {
  CBLReplicatedDocument(
    this.id,
    this.flags,
    this.error,
  );

  final String id;
  final Set<CBLReplicatedDocumentFlag> flags;
  final CBLErrorException? error;
}

class DocumentReplicationsCallbackMessage {
  DocumentReplicationsCallbackMessage(
    // ignore: avoid_positional_boolean_parameters
    this.isPush,
    this.documents,
  );

  DocumentReplicationsCallbackMessage.fromArguments(List<Object?> arguments)
      : this(
          arguments[0] as bool,
          parseDocuments(arguments[1] as List<Object?>),
        );

  static List<CBLReplicatedDocument> parseDocuments(List<Object?> documents) =>
      documents.cast<List<Object?>>().map((document) {
        CBLErrorException? error;
        if (document.length > 2) {
          error = CBLErrorException(
            (document[2] as int).toErrorDomain(),
            document[3] as int,
            utf8.decode(document[4] as Uint8List, allowMalformed: true),
          );
        }

        return CBLReplicatedDocument(
          utf8.decode(document[0] as Uint8List),
          CBLReplicatedDocumentFlag._parseCFlags(document[1] as int),
          error,
        );
      }).toList();

  final bool isPush;
  final List<CBLReplicatedDocument> documents;
}

// === ReplicatorBindings ======================================================

class ReplicatorBindings extends Bindings {
  ReplicatorBindings(super.parent) {
    _endpointCreateWithUrl = libs.cbl
        .lookupFunction<_CBLEndpoint_CreateWithURL, _CBLEndpoint_CreateWithURL>(
      'CBLEndpoint_CreateWithURL',
      isLeaf: useIsLeaf,
    );
    if (libs.enterpriseEdition) {
      _endpointCreateWithLocalDB = libs.cbl.lookupFunction<
          _CBLDart_CBLEndpoint_CreateWithLocalDB,
          _CBLDart_CBLEndpoint_CreateWithLocalDB>(
        'CBLEndpoint_CreateWithLocalDB',
        isLeaf: useIsLeaf,
      );
    }
    _endpointFree =
        libs.cbl.lookupFunction<_CBLEndpoint_Free_C, _CBLEndpoint_Free>(
      'CBLEndpoint_Free',
      isLeaf: useIsLeaf,
    );
    _authCreatePassword = libs.cbl
        .lookupFunction<_CBLAuth_CreatePassword, _CBLAuth_CreatePassword>(
      'CBLAuth_CreatePassword',
      isLeaf: useIsLeaf,
    );
    _authCreateSession =
        libs.cbl.lookupFunction<_CBLAuth_CreateSession, _CBLAuth_CreateSession>(
      'CBLAuth_CreateSession',
      isLeaf: useIsLeaf,
    );
    _authFree = libs.cbl.lookupFunction<_CBLAuth_Free_C, _CBLAuth_Free>(
      'CBLAuth_Free',
      isLeaf: useIsLeaf,
    );
    _create = libs.cblDart.lookupFunction<_CBLDart_CBLReplicator_Create,
        _CBLDart_CBLReplicator_Create>(
      'CBLDart_CBLReplicator_Create',
      isLeaf: useIsLeaf,
    );
    _releasePtr = libs.cblDart.lookup('CBLDart_CBLReplicator_Release');
    _start =
        libs.cbl.lookupFunction<_CBLReplicator_Start_C, _CBLReplicator_Start>(
      'CBLReplicator_Start',
      isLeaf: useIsLeaf,
    );
    _stop = libs.cbl.lookupFunction<_CBLReplicator_Stop_C, _CBLReplicator_Stop>(
      'CBLReplicator_Stop',
      isLeaf: useIsLeaf,
    );
    _setHostReachable = libs.cbl.lookupFunction<
        _CBLReplicator_SetHostReachable_C, _CBLReplicator_SetHostReachable>(
      'CBLReplicator_SetHostReachable',
      isLeaf: useIsLeaf,
    );
    _setSuspended = libs.cbl.lookupFunction<_CBLReplicator_SetSuspended_C,
        _CBLReplicator_SetSuspended>(
      'CBLReplicator_SetSuspended',
      isLeaf: useIsLeaf,
    );
    _status =
        libs.cbl.lookupFunction<_CBLReplicator_Status, _CBLReplicator_Status>(
      'CBLReplicator_Status',
      isLeaf: useIsLeaf,
    );
    _pendingDocumentIDs = libs.cbl.lookupFunction<
        _CBLReplicator_PendingDocumentIDs, _CBLReplicator_PendingDocumentIDs>(
      'CBLReplicator_PendingDocumentIDs',
      isLeaf: useIsLeaf,
    );
    _isDocumentPending = libs.cbl.lookupFunction<
        _CBLReplicator_IsDocumentPending_C, _CBLReplicator_IsDocumentPending>(
      'CBLReplicator_IsDocumentPending',
      isLeaf: useIsLeaf,
    );
    _addChangeListener = libs.cblDart.lookupFunction<
        _CBLDart_CBLReplicator_AddChangeListener_C,
        _CBLDart_CBLReplicator_AddChangeListener>(
      'CBLDart_CBLReplicator_AddChangeListener',
      isLeaf: useIsLeaf,
    );
    _addDocumentReplicationListener = libs.cblDart.lookupFunction<
        _CBLDart_CBLReplicator_AddDocumentReplicationListener_C,
        _CBLDart_CBLReplicator_AddDocumentReplicationListener>(
      'CBLDart_CBLReplicator_AddDocumentReplicationListener',
      isLeaf: useIsLeaf,
    );
  }

  late final _CBLEndpoint_CreateWithURL _endpointCreateWithUrl;
  late final _CBLDart_CBLEndpoint_CreateWithLocalDB _endpointCreateWithLocalDB;
  late final _CBLEndpoint_Free _endpointFree;
  late final _CBLAuth_CreatePassword _authCreatePassword;
  late final _CBLAuth_CreateSession _authCreateSession;
  late final _CBLAuth_Free _authFree;
  late final _CBLDart_CBLReplicator_Create _create;
  late final Pointer<NativeFunction<_CBLDart_CBLReplicator_Release_C>>
      _releasePtr;
  late final _CBLReplicator_Start _start;
  late final _CBLReplicator_Stop _stop;
  late final _CBLReplicator_SetHostReachable _setHostReachable;
  late final _CBLReplicator_SetSuspended _setSuspended;
  late final _CBLReplicator_Status _status;
  late final _CBLReplicator_PendingDocumentIDs _pendingDocumentIDs;
  late final _CBLReplicator_IsDocumentPending _isDocumentPending;
  late final _CBLDart_CBLReplicator_AddChangeListener _addChangeListener;
  late final _CBLDart_CBLReplicator_AddDocumentReplicationListener
      _addDocumentReplicationListener;

  late final _finalizer = NativeFinalizer(_releasePtr.cast());

  Pointer<CBLEndpoint> createEndpointWithUrl(String url) =>
      runWithSingleFLString(
        url,
        (flUrl) =>
            _endpointCreateWithUrl(flUrl, globalCBLError).checkCBLError(),
      );

  Pointer<CBLEndpoint> createEndpointWithLocalDB(
    Pointer<CBLDatabase> database,
  ) =>
      _endpointCreateWithLocalDB(database);

  void freeEndpoint(Pointer<CBLEndpoint> endpoint) {
    _endpointFree(endpoint);
  }

  Pointer<CBLAuthenticator> createPasswordAuthenticator(
    String username,
    String password,
  ) =>
      withGlobalArena(() => _authCreatePassword(
            username.toFLString(),
            password.toFLString(),
          ));

  Pointer<CBLAuthenticator> createSessionAuthenticator(
    String sessionID,
    String? cookieName,
  ) =>
      withGlobalArena(() => _authCreateSession(
            sessionID.toFLString(),
            cookieName.toFLString(),
          ));

  void freeAuthenticator(Pointer<CBLAuthenticator> authenticator) {
    _authFree(authenticator);
  }

  Pointer<CBLReplicator> createReplicator(CBLReplicatorConfiguration config) =>
      withGlobalArena(() => _create(
            _createConfiguration(config),
            globalCBLError,
          ).checkCBLError());

  void bindToDartObject(Finalizable object, Pointer<CBLReplicator> replicator) {
    _finalizer.attach(object, replicator.cast());
  }

  void start(
    Pointer<CBLReplicator> replicator, {
    required bool resetCheckpoint,
  }) {
    _start(replicator, resetCheckpoint);
  }

  void stop(Pointer<CBLReplicator> replicator) {
    _stop(replicator);
  }

  void setHostReachable(
    Pointer<CBLReplicator> replicator, {
    required bool reachable,
  }) {
    _setHostReachable(replicator, reachable);
  }

  void setSuspended(
    Pointer<CBLReplicator> replicator, {
    required bool suspended,
  }) {
    _setSuspended(replicator, suspended);
  }

  CBLReplicatorStatus status(Pointer<CBLReplicator> replicator) =>
      _status(replicator).toCBLReplicatorStatus();

  Pointer<FLDict> pendingDocumentIDs(Pointer<CBLReplicator> replicator) =>
      _pendingDocumentIDs(replicator, globalCBLError).checkCBLError();

  bool isDocumentPending(
    Pointer<CBLReplicator> replicator,
    String docID,
  ) =>
      runWithSingleFLString(
        docID,
        (flDocID) => _isDocumentPending(replicator, flDocID, globalCBLError)
            .checkCBLError(),
      );

  void addChangeListener(
    Pointer<CBLDatabase> db,
    Pointer<CBLReplicator> replicator,
    Pointer<CBLDartAsyncCallback> listener,
  ) {
    _addChangeListener(db, replicator, listener);
  }

  void addDocumentReplicationListener(
    Pointer<CBLDatabase> db,
    Pointer<CBLReplicator> replicator,
    Pointer<CBLDartAsyncCallback> listener,
  ) {
    _addDocumentReplicationListener(db, replicator, listener);
  }

  Pointer<_CBLDartReplicatorConfiguration> _createConfiguration(
    CBLReplicatorConfiguration config,
  ) {
    final result = globalArena<_CBLDartReplicatorConfiguration>();

    result.ref
      ..database = config.database
      ..endpoint = config.endpoint
      ..replicatorType = config.replicatorType
      ..continuous = config.continuous
      ..disableAutoPurge = config.disableAutoPurge ?? false
      ..maxAttempts = config.maxAttempts ?? 0
      ..maxAttemptWaitTime = config.maxAttemptWaitTime ?? 0
      ..heartbeat = config.heartbeat ?? 0
      ..authenticator = config.authenticator ?? nullptr
      ..proxy = _createProxySettings(config.proxy)
      ..headers = config.headers ?? nullptr
      ..pinnedServerCertificate = config.pinnedServerCertificate
              ?.toSliceResult()
              .flSlice(globalArena) ??
          nullptr
      ..trustedRootCertificates = config.trustedRootCertificates
              ?.toSliceResult()
              .flSlice(globalArena) ??
          nullptr
      ..channels = config.channels ?? nullptr
      ..documentIDs = config.documentIDs ?? nullptr
      ..pushFilter = config.pushFilter ?? nullptr
      ..pullFilter = config.pullFilter ?? nullptr
      ..conflictResolver = config.conflictResolver ?? nullptr;

    return result;
  }

  Pointer<_CBLProxySettings> _createProxySettings(
    CBLProxySettings? settings,
  ) {
    if (settings == null) {
      return nullptr;
    }

    final result = globalArena<_CBLProxySettings>();

    result.ref
      ..type = settings.type
      ..hostname = settings.hostname.toFLString()
      ..port = settings.port
      ..username = settings.username.toFLString()
      ..password = settings.password.toFLString();

    return result;
  }
}
