enum CacheKey {
  accessToken('accessToken'),

  favorites('favoritesList');

  const CacheKey(this.value);

  final String value;
}
