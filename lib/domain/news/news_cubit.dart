import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_mad_robot_test/core/dependencies/injections.dart';
import 'package:red_mad_robot_test/data/models/news_model.dart';
import 'package:red_mad_robot_test/data/repository/news_repository.dart';
import 'package:red_mad_robot_test/domain/news/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsRepository newsRepository;
  NewsCubit()
      : newsRepository = getIt<NewsRepository>(),
        super(NewsInitialState());

  List<ArticleModel> articles = [];
  int page = 1;

  Future<void> getNewsArticles() async {
    final state = _getNewsListState();
    try {
      emit(state.copyWith(isLoading: true, isFirstLaunch: page == 1));

      final results = await newsRepository.getNewsArticles(page: page);
      articles.addAll(results.articles);
      page++;
      emit(state.copyWith(
          isLoading: false, articels: articles, isFirstLaunch: page == 1));
    } catch (ex) {

      emit(state.copyWith(
          isLoading: false, articels: articles, isFirstLaunch: page == 1));
      emit(NewsErrorState(errorTxt: ex.toString()));
    }
  }

  NewsListState _getNewsListState() {
    return NewsListState(
        articels: articles,
        isLoading: false,
        createdAt: DateTime.now(),
        isFirstLaunch: false);
  }
}
