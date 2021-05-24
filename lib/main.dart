import 'package:bloc_test2/bloc/article/article_bloc.dart';
import 'package:bloc_test2/data/repository/article_repository.dart';
import 'package:bloc_test2/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cricket',
      home: BlocProvider(
        create: (context) => ArticleBloc(repository: ArticleRepositoryImpl()),
        child: HomePage(),
      ),
    );
  }
}
