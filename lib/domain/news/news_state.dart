import 'package:equatable/equatable.dart';
import 'package:red_mad_robot_test/data/models/news_model.dart';

class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsErrorState extends NewsState {
  final String errorTxt;

  NewsErrorState({required this.errorTxt});
}

class NewsListState extends NewsState {
  final bool isLoading;
  final List<ArticleModel> articels;
  final bool isFirstLaunch; 

  final DateTime? createdAt;
  NewsListState(
      {this.isLoading = false, this.articels = const [], this.createdAt  , this.isFirstLaunch = false});
  NewsListState copyWith(
          {List<ArticleModel>? articels,
          bool? isLoading = false,
          DateTime? createdAt , 
          bool? isFirstLaunch}) =>
      NewsListState(
          isLoading: isLoading ?? this.isLoading,
          createdAt: createdAt ?? this.createdAt,
          articels: articels ?? this.articels , 
          isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch);

  @override
  List<Object?> get props => [articels, isLoading, createdAt , isFirstLaunch];
}
