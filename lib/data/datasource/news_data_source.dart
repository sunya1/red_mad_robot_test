import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:red_mad_robot_test/core/consts/network/global_api_consts.dart';
import 'package:red_mad_robot_test/core/consts/network/network_call_routes.dart';

@injectable
class NewsDataSource {
  final Dio _http;

  NewsDataSource(this._http);

  Future<Response> getNews({required int page}) async {
    final response = await _http.get(NetworkCallRoutes.getNews,
        queryParameters: {'q': 'bitcoin', 'apiKey': GlobalApiConstants.apiKey , 'page' : page});

    return response;
  }
}
