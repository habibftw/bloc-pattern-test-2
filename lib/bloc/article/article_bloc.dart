import 'package:bloc/bloc.dart';
import 'package:bloc_test2/bloc/article/article_event.dart';
import 'package:bloc_test2/bloc/article/article_state.dart';
import 'package:bloc_test2/data/model/api_result_model.dart';
import 'package:bloc_test2/data/repository/article_repository.dart';
import 'package:meta/meta.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {

  ArticleRepository repository;

  ArticleBloc({@required this.repository}) : super(null);

  @override
  // TODO: implement initialState
  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticlesEvent) {
      yield ArticleLoadingState();
      try {
        List<Articles> articles = await repository.getArticles();
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }

}