import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:red_mad_robot_test/core/consts/style/app_colors.dart';
import 'package:red_mad_robot_test/core/consts/widgets/app_loader_widget.dart';

class AppNetworkImageWidget extends StatelessWidget {
  final String url;
  const AppNetworkImageWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(fit: BoxFit.cover, image: imageProvider)),
        );
      },
      progressIndicatorBuilder: ((context, url, progress) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.grey24, borderRadius: BorderRadius.circular(10)),
          child: const AppLoaderWidget(
            color: Colors.white,
          ),
        );
      }),
      errorWidget: (context, url, error) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://static.displate.com/857x1200/displate/2022-07-07/fb201c5aef2a8558a1eec3a095be6d49_1c1023275f02c2ee7bc146309a812775.jpg"))),
        );
      },
    );
  }
}
