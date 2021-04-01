/// An entity which can be stored as a Couchbase Lite document.
abstract class Entity {
  /// The id of this entity.
  String? get id;

  /// The current sequence of this entity in the local database.
  ///
  /// This number increases every time the entity is saved, and a more
  /// recently saved document will have a greater sequence number than one saved
  /// earlier, so sequences may be used as an abstract 'clock' to tell relative
  /// modification times.
  int? get sequence;

  /// Whether this entity is new or was loaded from the database.
  bool get isNew => sequence == null;
}
