import 'package:cbl/cbl.dart';

import '../utils/database_utils.dart';
import '../utils/lang_utils.dart';
import 'entity_converter.dart';
import 'entity_utils.dart';

abstract class EntityManager {
  Future<T> save<T>(T entity);

  Future<T?> load<T>(String id);

  Future<bool> delete<T>(T entity);
}

class CouchbaseLiteEntityManager extends EntityManager {
  CouchbaseLiteEntityManager({
    required this.database,
    required this.entityConverter,
    required this.entityUtils,
  });

  final Database database;
  final EntityConverter entityConverter;
  final EntityUtils entityUtils;

  @override
  Future<T> save<T>(T entity) async {
    final entityId = entityUtils.getIdFromEntity(entity);

    final doc = entityUtils.isNewEntity(entity)
        ? MutableDocument(entityId)
        : await database
            .getDocumentOrThrow(entityId!)
            .then((doc) => doc.mutableCopy());

    doc.properties = MutableDict(entityConverter.entityToProperties(entity));

    final savedDoc = await database.saveDocument(doc);

    return entityConverter.documentToEntity<T>(savedDoc);
  }

  @override
  Future<T?> load<T>(String id) async {
    final doc = await database.getDocument(id);
    return doc?.let(entityConverter.documentToEntity);
  }

  @override
  Future<bool> delete<T>(T entity) async {
    final id = entityUtils.getIdFromEntity(entity);

    final doc = await database.getDocument(id!);
    final docExists = doc != null;

    if (docExists) {
      await doc!.delete();
    }

    return docExists;
  }
}
