import 'package:cbl/cbl.dart';
import 'package:cbl_data/cbl_data.dart';
import 'package:cbl_flutter/cbl_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Database db;
  TestEntityRepository repo;

  setUpAll(() async {
    CouchbaseLite.initialize(libraries: flutterLibraries());

    final appDocsDir = await getApplicationDocumentsDirectory();

    db = await Database.open(
      'CblDataTest',
      config: DatabaseConfiguration(directory: appDocsDir.path),
    );

    final entityMetadataRegistry = EntityMetadataRegistry([
      EntityMetadata<TestEntity>(
        typeName: 'TestEntity',
        deserializer: TestEntity.fromJson,
      ),
    ]);

    final entityRepositoryContext = EntityRepositoryContext(
      database: db,
      entityMetadataRegistry: entityMetadataRegistry,
    );

    repo = TestEntityRepository(entityRepositoryContext);
  });

  tearDownAll(() async {
    await db.close();
  });

  testWidgets('save new entity', (_) async {
    final entity = TestEntity(name: 'A');
    final savedEntity = await repo.save(entity);

    expect(savedEntity.name, entity.name);
    expect(savedEntity.id, isNotNull);
    expect(savedEntity.sequence, isNotNull);
  });

  testWidgets('save existing entity', (_) async {
    final entity = TestEntity(name: 'A');
    final savedEntityA = await repo.save(entity);
    final savedEntityB = await repo.save(savedEntityA);

    expect(savedEntityB.id, savedEntityA.id);
    expect(savedEntityB.sequence, greaterThan(savedEntityA.sequence));
    expect(savedEntityB.name, savedEntityA.name);
  });

  testWidgets('delete all', (_) async {
    await repo.save(TestEntity(name: 'A'));
    await repo.deleteAll();

    expect(await repo.findAll().execute(), isEmpty);
  });
}

class TestEntity extends Entity {
  TestEntity({
    this.id,
    this.sequence,
    @required this.name,
  });

  @override
  final String id;

  @override
  final int sequence;

  final String name;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'sequence': sequence,
        'name': name,
      };

  static TestEntity fromJson(Map<String, dynamic> json) => TestEntity(
        id: json['id'] as String,
        sequence: json['sequence'] as int,
        name: json['name'] as String,
      );
}

class TestEntityRepository extends EntityRepository<TestEntity> {
  TestEntityRepository(EntityRepositoryContext context) : super(context);
}
