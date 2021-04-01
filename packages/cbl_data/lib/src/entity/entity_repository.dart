import 'package:cbl/cbl.dart';
import 'package:meta/meta.dart';

import '../query_template.dart';
import '../transform_query.dart';
import '../utils/lang_utils.dart';
import 'entity_converter.dart';
import 'entity_manager.dart';
import 'entity_metadata.dart';
import 'entity_utils.dart';
import 'n1ql_entity_query_utils.dart';

/// Context for entity repositories wich provided supporting classes, commonly
/// used to implement repositories.
class EntityRepositoryContext {
  /// Creates a context from a [database] and an [entityMetadataRegistry] by
  /// creating the remaining components.
  ///
  /// Use [EntityRepositoryContext.raw] if you want to explicitly provide all
  /// components.
  factory EntityRepositoryContext({
    required Database database,
    required EntityMetadataRegistry entityMetadataRegistry,
  }) {
    final entityUtils = EntityUtils(entityMetadataRegistry);
    final entityConverter =
        EntityConverter(entityMetadataRegistry, entityUtils);
    final entityManager = CouchbaseLiteEntityManager(
      database: database,
      entityConverter: entityConverter,
      entityUtils: entityUtils,
    );
    return EntityRepositoryContext.raw(
      database: database,
      entityMetadataRegistry: entityMetadataRegistry,
      entityManager: entityManager,
      entityConverter: entityConverter,
      entityUtils: entityUtils,
    );
  }

  /// Creates a context directly from the supplied components.
  EntityRepositoryContext.raw({
    required this.database,
    required this.entityMetadataRegistry,
    required this.entityManager,
    required this.entityConverter,
    required this.entityUtils,
  });

  /// The database the repository will use.
  final Database database;

  /// The metadata registry the repository will use.
  final EntityMetadataRegistry entityMetadataRegistry;

  /// The entity manager the repository will use.
  final EntityManager entityManager;

  /// The entity converter the repository will use.
  final EntityConverter entityConverter;

  /// The entity utils the repository will use.
  final EntityUtils entityUtils;
}

/// A repository for entities of type [T].
///
/// This class can be used directly or as the base class for custom entity
/// repositories and provides a number of methods for commonly used CRUD
/// operations.
class EntityRepository<T> {
  /// Creates a repository for entities of type [T].
  EntityRepository(this.context)
      : _queryTemplate = QueryTemplate(context.database),
        _queryUtils = N1QLEntityQueryUtils(
          context.entityMetadataRegistry,
          context.entityConverter,
        );

  /// Context wich provided supporting classes, commonly used to implement
  /// repositories.
  @protected
  final EntityRepositoryContext context;

  final QueryTemplate _queryTemplate;

  final N1QLEntityQueryUtils _queryUtils;

  /// Saves an [entity] and returns the saved version.
  Future<T> save(T entity) => context.entityManager.save(entity);

  /// Finds an entity by it's [id].
  ///
  /// The entity must exist.
  TransformQuery<T> findById(String id) => _queryTemplate.findOneResult(
        N1QLQuery('''
        SELECT ${_queryUtils.documentDataSelectionSet()}
        FROM $defaultAlias
        WHERE 
          ${_queryUtils.typePredicate<T>()} AND 
          $defaultAlias.META.id = \$ID
        '''),
        _queryUtils.extractEntityFromResult,
        parameters: <String, dynamic>{'ID': id},
      );

  /// Finds an entity by it's [id] or returns `null` if it doesn't exist.
  TransformQuery<T?> findByIdOrNull(String id) =>
      _queryTemplate.findOneResultOrNull(
        N1QLQuery('''
        SELECT ${_queryUtils.documentDataSelectionSet()}
        FROM $defaultAlias
        WHERE 
          ${_queryUtils.typePredicate<T>()} AND 
          $defaultAlias.META.id = \$ID
        '''),
        _queryUtils.extractEntityFromResult,
        parameters: <String, dynamic>{'ID': id},
      );

  /// Finds all entities this repository contains.
  ///
  /// The entities are ordered by their ids.
  TransformQuery<Iterable<T>> findAll() => _queryTemplate.findManyResults(
        N1QLQuery('''
        SELECT ${_queryUtils.documentDataSelectionSet()}
        FROM $defaultAlias
        WHERE ${_queryUtils.typePredicate<T>()}
        ORDER BY $defaultAlias.META.id
        '''),
        _queryUtils.extractEntityFromResult,
      );

  /// Deletes an [entity] if it exists in the database.
  ///
  /// Returns whether the entity existed in the database and was deleted.
  Future<bool> delete(T entity) => context.entityManager.delete(entity);

  /// Deletes an entity by it's id if it exists in the database.
  ///
  /// Returns whether the entity existed in the database and was deleted.
  Future<bool> deleteById(String id) async {
    final doc = await context.database.getDocument(id);
    final docExists = doc != null;

    if (docExists) {
      context.entityUtils.checkDocumentType<T>(doc!);
      await doc.delete();
    }

    return docExists;
  }

  /// Deletes all entities this repository contains.
  Future<void> deleteAll() => _queryTemplate
      .findManyValues<String>(
        N1QLQuery('''
        SELECT $defaultAlias.META.id
        FROM $defaultAlias
        WHERE ${_queryUtils.typePredicate<T>()}
        ORDER BY $defaultAlias.META.id
        '''),
      )
      .execute()
      .asStream()
      .expand(identity)
      .asyncMap(deleteById)
      .drain<void>();
}
