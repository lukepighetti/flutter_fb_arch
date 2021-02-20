extension MapX<K, V> on Map<K, V> {
  /// Return this map without `null` values.
  ///
  /// ie `{1:1, 2:null}.withoutNullValues == {1:1}`
  Map<K, V> get withoutNullValues =>
      {...this}..removeWhere((key, value) => value == null);
}
