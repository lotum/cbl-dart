import 'package:cbl/cbl.dart';

import '../document_data.dart';
import 'entity_metadata.dart';

class EntityUtils {
  EntityUtils(this.entityMetadataRegistry);

  final EntityMetadataRegistry entityMetadataRegistry;

  bool isNewEntity<T>(T entity) =>
      entityMetadataRegistry.getForType<T>().sequenceGetter(entity) == null;

  String? getIdFromEntity<T>(T entity) =>
      entityMetadataRegistry.getForType<T>().idGetter(entity);

  void checkDocumentType<T>(Document doc) {
    final metadata = entityMetadataRegistry.getForType<T>();
    final type = _getTypeFromPropertiesDict(metadata, doc.properties);
    _checkType(metadata, type, doc);
  }

  void checkDocumentDataType<T>(DocumentData data) {
    final metadata = entityMetadataRegistry.getForType<T>();
    final type = _getTypeFromPropertiesMap(metadata, data.properties);
    _checkType(metadata, type, data);
  }

  String? _getTypeFromPropertiesMap(
    EntityMetadata metadata,
    Map<String, dynamic> properties,
  ) {
    final dynamic type = properties[metadata.typeProperty];
    return type is String ? type : null;
  }

  String? _getTypeFromPropertiesDict(EntityMetadata metadata, Dict properties) {
    final type = properties[metadata.typeProperty];

    if (type.isNull || type.isUndefined || type.type != ValueType.string) {
      return null;
    }

    return type.asString;
  }

  void _checkType(EntityMetadata metadata, String? type, Object doc) {
    if (type != metadata.typeName) {
      throw ArgumentError.value(
        doc,
        'doc',
        'The document is not a ${metadata.typeName}. '
            'It has a type property of $type',
      );
    }
  }
}
