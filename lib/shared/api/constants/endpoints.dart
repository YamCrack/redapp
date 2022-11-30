class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = 'http://192.168.1.5:8080/api/';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String usersRemove = 'user.remove';
  static const String usersLogin = 'user.auth';
  static const String usersInfo = 'user.info';
  static const String usersList = 'user.list';
}
