import 'package:cbl/cbl.dart';

import '../document_data.dart';
import 'entity_utils.dart';
import 'entity_metadata.dart';

class EntityConverter {
  EntityConverter(this.entityMetadataRegistry, this.entityUtils);

  final EntityMetadataRegistry entityMetadataRegistry;

  final EntityUtils entityUtils;

  T documentToEntity<T>(Document document) =>
      documentDataToEntity(DocumentData.fromDocument(document));

  T documentDataToEntity<T>(DocumentData data) {
    entityUtils.checkDocumentDataType<T>(data);

    final metadata = entityMetadataRegistry.getForType<T>();

    final entityJson = Map<String, dynamic>.from(data.properties);
    _removeTypeFromPropertiesMap(metadata, entityJson);
    _addMetaPropertiesToEntityJson(metadata, entityJson, data);

    return metadata.deserializer(entityJson);
  }

  Map<String, dynamic> entityToProperties<T>(T entity) {
    final metadata = entityMetadataRegistry.getForType<T>();
    final entityJson = metadata.serializer(entity);
    _removeMetaPropertiesFromEntityJson(metadata, entityJson);
    _setTypeInPropertiesMap(metadata, entityJson);
    return entityJson;
  }

  void _setTypeInPropertiesMap(
    EntityMetadata metadata,
    Map<String, dynamic> properties,
  ) {
    properties[metadata.typeProperty] = metadata.typeName;
  }

  void _removeTypeFromPropertiesMap(
    EntityMetadata metadata,
    Map<String, dynamic> properties,
  ) {
    properties.remove(metadata.typeProperty);
  }

  void _removeMetaPropertiesFromEntityJson(
    EntityMetadata metadata,
    Map<String, dynamic> json,
  ) {
    for (final key in metadata.metaPropertiesMapping.values) {
      json.remove(key);
    }
  }

  void _addMetaPropertiesToEntityJson(
    EntityMetadata metadata,
    Map<String, dynamic> json,
    DocumentData data,
  ) {
    json[metadata.metaPropertiesMapping['id']!] = data.id;
    json[metadata.metaPropertiesMapping['sequence']!] = data.sequence;
  }
}
