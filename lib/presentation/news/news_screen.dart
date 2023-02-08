import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_mad_robot_test/core/consts/style/app_colors.dart';
import 'package:red_mad_robot_test/core/consts/style/app_text_styles.dart';
import 'package:red_mad_robot_test/core/consts/widgets/app_loader_widget.dart';
import 'package:red_mad_robot_test/domain/news/news_cubit.dart';
import 'package:red_mad_robot_test/domain/news/news_state.dart';
import 'package:red_mad_robot_test/presentation/news/widgets/news_grid_view_widget.dart';
import 'package:red_mad_robot_test/presentation/news/widgets/news_list_item_widget.dart';
import 'package:red_mad_robot_test/presentation/news/widgets/news_list_view_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsCubit newsCubit;
  final scrollController = ScrollController();

  @override
  void initState() {
    newsCubit = context.read<NewsCubit>();

    newsCubit.getNewsArticles();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setupScrollController(context);
    });
    super.initState();
  }

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          newsCubit.getNewsArticles();
        }
      }
    });
  }

  bool isListView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("News",
            style: AppTextStyles.header.copyWith(color: AppColors.mainColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isListView = !isListView; 
                    });
                  },
                  icon: Icon(isListView ? Icons.grid_view_sharp : Icons.list)),
            ),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsState>(
                buildWhen: (previous, current) => current is NewsListState,
                builder: (context, state) {
                  if (state is NewsListState) {
                    if (state.isLoading && state.isFirstLaunch) {
                      return const Center(child: AppLoaderWidget());
                    }
                    if (isListView) {
                      return NewsListViewWidget(
                          controller: scrollController,
                          articles: state.articels,
                          isLoading: state.isLoading);
                    }

                    return NewsGridViewWidget(
                        articles: state.articels,
                        controller: scrollController,
                        isLoading: state.isLoading);
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
