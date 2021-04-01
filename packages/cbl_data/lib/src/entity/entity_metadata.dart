import 'package:collection/collection.dart';

/// Function which given an [entity] returns a json representation of the
/// entity.
typedef EntitySerializer<T> = Map<String, dynamic> Function(T entity);

/// Function which deserializes an entity from its [json] representation.
typedef EntityDeserializer<T> = T Function(Map<String, dynamic> json);

typedef EntityIdGetter<T> = String? Function(T entity);

typedef EntitySequenceGetter<T> = int? Function(T entity);

/// Metadata about an entity.
class EntityMetadata<T> {
  static const defaultTypeProperty = 'type';

  static const defaultMetaPropertiesMapping = {
    'id': 'id',
    'sequence': 'sequence',
  };

  /// The default [EntitySerializer], which calls `toJson` to produce the
  /// [entity]s json representation.
  static Map<String, dynamic> defaultSerializer<T>(T entity) =>
      (entity as dynamic).toJson() as Map<String, dynamic>;

  static String? defaultIdGetter<T>(T entity) =>
      (entity as dynamic).id as String?;

  static int? defaultSequenceGetter<T>(T entity) =>
      (entity as dynamic).sequence as int?;

  /// Creates metadata about an entity.
  EntityMetadata({
    this.typeProperty = defaultTypeProperty,
    required this.typeName,
    this.metaPropertiesMapping = defaultMetaPropertiesMapping,
    EntityIdGetter<T>? idGetter,
    EntitySequenceGetter<T>? sequenceGetter,
    EntitySerializer<T>? propertiesSerializer,
    required this.deserializer,
  })   : idGetter = idGetter ?? defaultIdGetter,
        sequenceGetter = sequenceGetter ?? defaultSequenceGetter,
        serializer = propertiesSerializer ?? defaultSerializer {
    _validateMetaPropertiesMapping(metaPropertiesMapping);
  }

  /// The Dart [Type] of the entity.
  final Type dartType = T;

  /// The name of the document property to store the [typeName] of the entity
  /// in.
  final String typeProperty;

  /// The name which is used to distinguish the entity from other entities.
  final String typeName;

  final Map<String, String> metaPropertiesMapping;

  /// The [EntityIdGetter] to use for with instances of the entity.
  final EntityIdGetter<T> idGetter;

  /// The [EntitySequenceGetter] to use for with instances of the entity.
  final EntitySequenceGetter<T> sequenceGetter;

  /// The [EntitySerializer] to use for with instances of the entity.
  final EntitySerializer<T> serializer;

  /// The [EntityDeserializer] to use to deserialize instances of the entity.
  final EntityDeserializer<T> deserializer;
}

void _validateMetaPropertiesMapping(
  Map<String, String> metaPropertiesMapping,
) {
  final metaKeys = ['id', 'sequence'];

  if (!const DeepCollectionEquality.unordered()
      .equals(metaPropertiesMapping.keys.toList(), metaKeys)) {
    throw ArgumentError.value(
      metaPropertiesMapping,
      'metaPropertiesMapping',
      'must have exactly these keys: $metaKeys, '
          'but has ${metaPropertiesMapping.keys}',
    );
  }
}

class EntityMetadataRegistry {
  EntityMetadataRegistry(List<EntityMetadata> metadata)
      : _metadata = Map.fromEntries(metadata.map((metadata) {
          return MapEntry(metadata.dartType, metadata);
        }));

  final Map<Type, EntityMetadata> _metadata;

  EntityMetadata<T> getForType<T>() {
    final result = _metadata[T];

    if (result == null) {
      throw ArgumentError.value(
        T,
        'T',
        'Could not find entity metadata for type',
      );
    }

    return result as EntityMetadata<T>;
  }
}
