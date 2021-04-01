import 'package:cbl/cbl.dart';
import 'package:collection/collection.dart';

/// Exception thrown when a document with the id [id] could not be found.
class DocumentNotFoundException implements Exception {
  /// Creates a new `DocumentNotFoundException` with the relevant [id].
  DocumentNotFoundException({required this.id});

  late final String message = 'Could not find a document with id: $id';

  /// The id for which no document was found.
  final String id;

  @override
  String toString() => 'DocumentNotFound(message: $message, id: $id)';
}

/// Exception thrown when a result has a size outside of [minResults] and
/// [maxResults].
class BadResultSizeException implements Exception {
  /// Creates a new `BadResultSizeException` with the expected [minResults] and
  /// [maxResults] and the conflicting [results].
  BadResultSizeException(this.minResults, this.maxResults, this.results);

  late final String message =
      'Expected between $minResults and $maxResults results '
      'but got ${results.length}';

  /// The expected minimum number of results.
  final int minResults;

  /// The expected maximum number of results.
  final int maxResults;

  /// The conflicting results.
  final List results;

  @override
  String toString() => 'BadResultSizeException('
      'message: $message, '
      'minResults: $minResults, '
      'maxResults: $maxResults, '
      'results: $results'
      ')';

  /// Checks that [results] contains a single result and returns it.
  ///
  /// If this is not the case it throws a [BadResultSizeException].
  static T single<T>(Iterable<T> results) {
    final list = results.toList();
    if (list.length != 1) {
      throw BadResultSizeException(1, 1, list);
    }

    return list.first;
  }

  /// Checks that [results] contains a single result or is empty and returns
  /// the single result or null.
  ///
  /// If this is not the case it throws a [BadResultSizeException].
  static T? singleOrEmpty<T>(Iterable<T> results) {
    final list = results.toList();
    if (list.length > 1) {
      throw BadResultSizeException(0, 1, list);
    }

    return list.firstOrNull;
  }
}

/// Exception thrown when a result has not exactly one column.
class BadValueResultException implements Exception {
  /// Creates a new `BadValueResultException` with the conflicting [columns].
  BadValueResultException(this.columns);

  late String message = 'Expected a result with exactly one column '
      'but got ${columns.length} columns';

  /// The conflicting columns.
  final Array columns;

  @override
  String toString() => 'BadValueResultException('
      'message: $message, '
      'columns: $columns'
      ')';

  /// Checks that [result] contains exactly one column and returns its value.
  ///
  /// If this is not the case it throws a [BadValueResultException].
  static Value checkResultAndGetValue(Result result) {
    final columns = result.array;
    if (columns.length != 1) {
      throw BadValueResultException(columns);
    }

    return columns.first;
  }
}
