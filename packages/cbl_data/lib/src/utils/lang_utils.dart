extension LangObjectExtension<T> on T {
  R let<R>(R Function(T) fn) => fn(this);
}

T identity<T>(T a) => a;

extension MapExtension<K, V> on Map<K, V> {
  Map<K, R> mapValues<R>(R Function(V) fn) => entries
      .map((entry) => MapEntry(entry.key, fn(entry.value)))
      .let((it) => Map.fromEntries(it));
}
