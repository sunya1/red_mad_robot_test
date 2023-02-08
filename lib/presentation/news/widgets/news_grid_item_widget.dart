import 'package:flutter/cupertino.dart';
import 'package:red_mad_robot_test/core/consts/style/app_text_styles.dart';
import 'package:red_mad_robot_test/core/consts/widgets/app_network_image_widget.dart';
import 'package:red_mad_robot_test/data/models/news_model.dart';

class NewsGridItemWidget extends StatelessWidget {
  final ArticleModel articleModel;
  const NewsGridItemWidget({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size; 
    return SizedBox(
      height: _size.height * 0.15,
      child: Column(
        children: [
          Flexible(flex: 2, child: AppNetworkImageWidget(url: articleModel.urlToImage)),
          const SizedBox(height: 12),
          Flexible(child: Text(articleModel.title, style: AppTextStyles.title500.copyWith(overflow: TextOverflow.fade)))
        ],
      ),
    );
  }
}
