import 'package:flutter/cupertino.dart';
import 'package:red_mad_robot_test/core/consts/widgets/app_loader_widget.dart';
import 'package:red_mad_robot_test/data/models/news_model.dart';
import 'package:red_mad_robot_test/presentation/news/widgets/news_grid_item_widget.dart';

class NewsGridViewWidget extends StatelessWidget {
  final List<ArticleModel> articles;
  final ScrollController controller;
  final bool isLoading;
  const NewsGridViewWidget(
      {super.key,
      required this.articles,
      required this.controller,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      itemCount: articles.length + (isLoading ? 1 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        if (index < articles.length) {
          return NewsGridItemWidget(articleModel: articles[index]);
        } else {
          controller.jumpTo(controller.position.maxScrollExtent);

          return const AppLoaderWidget();
        }
      },
    );
  }
}
