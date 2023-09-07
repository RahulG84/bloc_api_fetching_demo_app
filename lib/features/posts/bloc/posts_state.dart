part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostActionState extends PostsState{}

final class PostsInitial extends PostsState {}


class PostFetchingSuccesfull extends PostsState {
  final List<PostDataUiModel> post;

  PostFetchingSuccesfull({required this.post});
}

class PostFetchingLoadingState extends PostsState{}
