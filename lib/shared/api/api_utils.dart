Map<String, dynamic> getLikeCriteriaFromList(
    {required List<String> fields, required String query}) {
  final Map<String, dynamic> criteria = <String, dynamic>{};
  for (final String field in fields) {
    criteria[field] = <String, String>{r'$like': '%$query%'};
  }
  return criteria;
}

Map<String, dynamic> getLikeUserCriteria(String query) {
  return getLikeCriteriaFromList(fields: <String>[
    'code',
    'title',
    'description',
    'category',
    'brand',
    'tags',
    'status'
  ], query: query);
}
