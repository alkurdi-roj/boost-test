import 'package:boost_test/app/app_perefernces.dart';
import 'package:boost_test/models/data_source/app_api/app_api.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/data_source/dio_factory/dio_factory.dart';


final instance = GetIt.instance;


Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  instance.registerFactory<SharedPreferences>(() => sharedPreferences);

  instance.registerFactory<AppPreferences>(() => AppPreferences(instance()));
  instance.registerFactory<DioFactory>(() => DioFactory(instance()));
  final dio = await instance<DioFactory>().getDio();
  instance.registerFactory<AppServiceClient>(() => AppServiceClient(dio));
}

Future<void> resetAllModules() async {
  await instance.reset(dispose: false);
  await initAppModule();
}
