
import 'package:injectable/injectable.dart';
import 'package:red_mad_robot_test/data/datasource/news_data_source.dart';
import 'package:red_mad_robot_test/data/models/news_model.dart';

@injectable
class NewsRepository {
  NewsDataSource newsDataSource;

  NewsRepository(this.newsDataSource);
  Future<NewsModel> getNewsArticles({required int page}) async {
    final response = await newsDataSource.getNews(page: page);
    return newsFromJson(response.data);
  }
}
