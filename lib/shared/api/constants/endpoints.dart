class Endpoints {
  Endpoints._();

  // base url
  static const String serverUrl = 'http://192.168.1.5:8080';
  static const String baseUrl = '$serverUrl/api/';
  static const String imagesUrl = '$serverUrl/images/';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  // users
  static const String usersRemove = 'user.remove';
  static const String usersLogin = 'user.auth';
  static const String usersInfo = 'user.info';
  static const String usersList = 'user.list';

  // users
  static const String orderAdd = 'order.create';
  static const String orderUpdate = 'order.update';
  static const String orderInfo = 'order.info';

  // products
  static const String prodInfo = 'product.info';
  static const String prodList = 'product.list';
}
