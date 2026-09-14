import 'package:dio/dio.dart';
import 'package:doctorhunt/core/api/api_consumer.dart';
import 'package:doctorhunt/core/api/dio_consumer.dart';
import 'package:doctorhunt/core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


final locator = GetIt.instance;

void initServiceLocator() {
  //================================= External =================================== //
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => InternetConnectionChecker.instance);
  //================================== Core Network ================================ //
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: locator()));

  //==================================== Firebase =================================== //
  // locator.registerLazySingleton(() => FirebaseAuth.instance);
  // locator.registerLazySingleton(() => FirebaseFirestore.instance);
  // locator.registerLazySingleton(() => GoogleSignIn.instance);


   //===============================  Data Sources ============================================== //


  //============================  Repository  ===========================================//


  // ==========================  UseCases  ======================================== //


  //======================== Cubits =========================================// 

}
