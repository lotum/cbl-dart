import 'package:cbl/cbl.dart';

import '../document_data.dart';
import 'entity_converter.dart';
import 'entity_metadata.dart';

const defaultAlias = 'doc';

class N1QLEntityQueryUtils {
  N1QLEntityQueryUtils(this.metadataRegistry, this.converter);

  final EntityMetadataRegistry metadataRegistry;

  final EntityConverter converter;

  String documentDataSelectionSet([String alias = defaultAlias]) =>
      '$alias.META.id AS ${alias}_id, '
      '$alias.META.sequence AS ${alias}_sequence, '
      '$alias AS ${alias}_properties';

  String typePredicate<T>([String alias = defaultAlias]) {
    final metadata = metadataRegistry.getForType<T>();
    return '$alias.${metadata.typeProperty} = "${metadata.typeName}"';
  }

  DocumentData extractDocumentDataFromResult(
    Dict result, [
    String alias = defaultAlias,
  ]) {
    final id = result['${alias}_id'].asString;
    final sequence = result['${alias}_sequence'].asInt;
    final properties =
        result['${alias}_properties'].toObject() as Map<String, dynamic>;
    return DocumentData(id, sequence, properties);
  }

  T extractEntityFromDict<T>(
    Dict result, [
    String alias = defaultAlias,
  ]) =>
      converter
          .documentDataToEntity(extractDocumentDataFromResult(result, alias));

  T extractEntityFromResult<T>(
    Result result, [
    String alias = defaultAlias,
  ]) =>
      extractEntityFromDict(result.dict, alias);

  List<T> extractEntitiesFromResultSet<T>(
    ResultSet resultSet, [
    String alias = defaultAlias,
  ]) =>
      resultSet
          .map((result) => extractEntityFromResult<T>(result, alias))
          .toList();
}
