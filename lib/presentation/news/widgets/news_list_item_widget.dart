import 'package:flutter/material.dart';
import 'package:red_mad_robot_test/core/consts/style/app_text_styles.dart';
import 'package:red_mad_robot_test/core/consts/widgets/app_network_image_widget.dart';
import 'package:red_mad_robot_test/data/models/news_model.dart';

class NewsListItemWidget extends StatelessWidget {
  final ArticleModel articleModel;
  const NewsListItemWidget({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.12,
      child: Row(
        children: [
          Flexible(
            child: AppNetworkImageWidget(url: articleModel.urlToImage),
          ),
          const SizedBox(width: 12),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    articleModel.title,
                    style: AppTextStyles.title500.copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(height: 4),
                Flexible(
                  child: Text(
                    articleModel.description,
                    style: AppTextStyles.subtitle400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
///"https://imgresizer.eurosport.com/unsafe/2560x0/filters:format(jpeg)/origin-imgresizer.eurosport.com/2022/07/29/3424481-69874788-2560-1440.jpg"