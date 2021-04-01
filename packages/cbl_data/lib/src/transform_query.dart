import 'dart:async';

import 'package:cbl/cbl.dart';

/// A query which allows the creating of a new query whose result is a
/// transformation of the result of the source query.
abstract class TransformQuery<T> {
  /// Execute this query and returns its result.
  Future<T> execute();

  /// Returns a stream which allows you to observe the result of this query.
  ///
  /// When the returned stream is listened to it executes the query and emits
  /// the result. After that it emits when ever the result changes.
  ///
  /// The returned stream is a single subscription stream.
  Stream<T> changes();

  /// Returns a string which explains how this query is executed by the
  /// database.
  Future<String> explain();

  /// Transforms this query into a new query by applying [fn] to this query's
  /// result.
  TransformQuery<R> map<R>(R Function(T) fn) => _TransformQuery(this, fn);
}

/// Extension on [TransformQuery]s whose result is an [Iterable].
extension IterableTransformQueryExtension<T> on TransformQuery<Iterable<T>> {
  /// Returns a new query whose result is a [List] instead of an [Iterable].
  TransformQuery<List<T>> withList() => map((it) => it.toList());

  /// Returns a new query whose result has been transformed by applying [fn] to
  /// it's items.
  TransformQuery<Iterable<R>> mapItems<R>(R Function(T) fn) =>
      map((it) => it.map(fn));
}

/// Extension on [Database] to create [TransformQuery]s.
extension TransformQueryDatabaseExtension on Database {
  /// Creates a transform query which executes on this database.
  TransformQuery<ResultSet> transformQuery(
    QueryDefinition queryDefinition, {
    Map<String, dynamic>? parameters,
  }) =>
      _ResultSetTransformQuery(this, queryDefinition, parameters);
}

class _TransformQuery<T, R> extends TransformQuery<R> {
  _TransformQuery(this._source, this._fn);

  final TransformQuery<T> _source;

  final R Function(T) _fn;

  @override
  Future<R> execute() => _source.execute().then(_fn);

  @override
  Stream<R> changes() => _source.changes().map(_fn);

  @override
  Future<String> explain() => _source.explain();
}

class _ResultSetTransformQuery extends TransformQuery<ResultSet> {
  _ResultSetTransformQuery(
    this._database,
    this._queryDefinition,
    this._parameters,
  );

  final Database _database;
  final QueryDefinition _queryDefinition;
  final Map<String, dynamic>? _parameters;

  Future<Query> _createQuery() async {
    final query = await _database.query(_queryDefinition);

    if (_parameters != null) {
      await query.setParameters(MutableDict(_parameters));
    }

    return query;
  }

  @override
  Future<ResultSet> execute() =>
      _createQuery().then((query) => query.execute());

  @override
  Stream<ResultSet> changes() async* {
    final query = await _createQuery();
    yield* query.changes();
  }

  @override
  Future<String> explain() => _createQuery().then((query) => query.explain());
}
