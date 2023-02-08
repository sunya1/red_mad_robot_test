import 'package:flutter/material.dart';
import 'package:red_mad_robot_test/core/consts/widgets/app_loader_widget.dart';
import 'package:red_mad_robot_test/data/models/news_model.dart';
import 'package:red_mad_robot_test/presentation/news/widgets/news_list_item_widget.dart';

class NewsListViewWidget extends StatelessWidget {
  final ScrollController controller;
  final List<ArticleModel> articles;
  final bool isLoading; 
  const NewsListViewWidget({super.key, required this.controller, required this.articles, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: controller,
        shrinkWrap: true,
        itemCount: articles.length + (isLoading ? 1 : 0),
        separatorBuilder: (_, index) => const SizedBox(height: 16),
        itemBuilder: (_, index) {
          if (index < articles.length) {
            return NewsListItemWidget(articleModel: articles[index]);
          } else {
            controller.jumpTo(controller.position.maxScrollExtent);

            return const AppLoaderWidget();
          }
        });
  }
}
