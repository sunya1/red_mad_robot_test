import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_mad_robot_test/core/dependencies/injections.dart';
import 'package:red_mad_robot_test/domain/news/news_cubit.dart';
import 'package:red_mad_robot_test/presentation/news/news_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
            create: (context) => NewsCubit(), child: const NewsScreen()));
  }
}
