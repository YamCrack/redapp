Map<String, dynamic> getLikeCriteriaFromList({required List<String> fields, required String query}) {
  final Map<String, dynamic> criteria = <String, dynamic>{};
  final List<Map<String, dynamic>> or = <Map<String, dynamic>>[];
  for (final String field in fields) {
    // criteria[field] = <String, String>{r'$like': '%$query%'};
    or.add(<String, dynamic>{
      field: <String, String>{r'$like': '%$query%'}
    });
  }
  criteria[r'$or'] = or;
  return criteria;
}

Map<String, dynamic> getLikeUserCriteria(String query) {
  return getLikeCriteriaFromList(
      fields: <String>['id', 'code', 'firstName', 'status', 'lastName', 'email'], query: query);
}

Map<String, dynamic> getLikeProductCriteria(String query) {
  return getLikeCriteriaFromList(
      fields: <String>['code', 'title', 'description', 'category', 'brand', 'tags', 'status'], query: query);
}

Map<String, dynamic> getActiveOrdersCriteria(String id) {
  return {
    'id_salesman': id,
    'status': <String, dynamic>{
      r'$in': <String>['pending', 'processing']
    }
  };
}
