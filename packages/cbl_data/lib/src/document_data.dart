import 'package:cbl/cbl.dart';
import 'package:collection/collection.dart';

/// Representation of a stored [Document] that is independent of the [Document]
/// class.
class DocumentData {
  /// Creates a new `DocumentData` from the document's [id], [sequence]
  /// and [properties].
  DocumentData(this.id, this.sequence, this.properties);

  /// Creates a new `DocumentData` from the [document].
  factory DocumentData.fromDocument(Document document) => DocumentData(
        document.id,
        document.sequence,
        document.properties.toObject(),
      );

  /// The id of the [Document].
  final String id;

  /// The sequence of the [Document].
  final int sequence;

  /// The properties of the [Document], represented in Dart values.
  final Map<String, dynamic> properties;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocumentData &&
          id == other.id &&
          sequence == other.sequence &&
          const DeepCollectionEquality().equals(properties, other.properties);

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      sequence.hashCode ^
      const DeepCollectionEquality().hash(properties);

  @override
  String toString() => 'DocumentData('
      'id: $id, '
      'sequence: $sequence, '
      'properties: $properties'
      ')';
}
