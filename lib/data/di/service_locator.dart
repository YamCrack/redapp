import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../shared/api/dio_client.dart';
import '../../shared/api/user_api.dart';
import '../repository/auth_repository.dart';
import '../repository/user_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));
  getIt.registerSingleton(AuthRepository(getIt.get<UserApi>()));

  // getIt.registerSingleton(HomeController());
}
