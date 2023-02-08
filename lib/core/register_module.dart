import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:red_mad_robot_test/core/consts/network/global_api_consts.dart';

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => GlobalApiConstants.baseUrl;

  @lazySingleton
  Dio dio(@Named("BaseUrl") String url) {
    final dio = Dio(BaseOptions(baseUrl: url));

    return dio;
  }
}
