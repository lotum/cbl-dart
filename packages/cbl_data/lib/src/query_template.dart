import 'package:cbl/cbl.dart';

import 'exceptions.dart';
import 'transform_query.dart';

/// Function which transforms a [Result] into a value of type [T].
typedef ResultMapper<T> = T Function(Result);

/// Function which transforms a [Value] into a value of type [T].
typedef ValueMapper<T> = T Function(Value);

T _defaultValueMapper<T>(Value value) => value.toObject() as T;

ResultMapper<T> _resultValueMapper<T>([ValueMapper<T>? valueMapper]) {
  return (result) {
    final value = BadValueResultException.checkResultAndGetValue(result);
    return (valueMapper ?? _defaultValueMapper)(value);
  };
}

/// Helper class which removes the boilerplate from creating queries.
class QueryTemplate {
  /// Creates a new `QueryTemplate`, whose queries are executed in [database].
  QueryTemplate(this.database);

  /// The database in which the queries created with this template are executed
  /// in.
  final Database database;

  TransformQuery<R> findOneResult<R>(
    QueryDefinition queryDefinition,
    ResultMapper<R> mapper, {
    Map<String, dynamic>? parameters,
  }) =>
      findManyResults(
        queryDefinition,
        mapper,
        parameters: parameters,
      ).map(BadResultSizeException.single);

  TransformQuery<R?> findOneResultOrNull<R>(
    QueryDefinition queryDefinition,
    ResultMapper<R> mapper, {
    Map<String, dynamic>? parameters,
  }) =>
      findManyResults(
        queryDefinition,
        mapper,
        parameters: parameters,
      ).map(BadResultSizeException.singleOrEmpty);

  TransformQuery<Iterable<R>> findManyResults<R>(
    QueryDefinition queryDefinition,
    ResultMapper<R> mapper, {
    Map<String, dynamic>? parameters,
  }) =>
      database
          .transformQuery(
            queryDefinition,
            parameters: parameters,
          )
          .map((rs) => rs.map(mapper));

  TransformQuery<R> findOneValue<R>(
    QueryDefinition queryDefinition, {
    ValueMapper<R>? mapper,
    Map<String, dynamic>? parameters,
  }) =>
      findOneResult(
        queryDefinition,
        _resultValueMapper(mapper),
        parameters: parameters,
      );

  TransformQuery<R?> findOneValueOrNull<R>(
    QueryDefinition queryDefinition, {
    ValueMapper<R>? mapper,
    Map<String, dynamic>? parameters,
  }) =>
      findOneResultOrNull(
        queryDefinition,
        _resultValueMapper(mapper),
        parameters: parameters,
      );

  TransformQuery<Iterable<R>> findManyValues<R>(
    QueryDefinition queryDefinition, {
    ValueMapper<R>? mapper,
    Map<String, dynamic>? parameters,
  }) =>
      findManyResults(
        queryDefinition,
        _resultValueMapper(mapper),
        parameters: parameters,
      );
}
