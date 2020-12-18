abstract class PostsStates {}

class PostsInitialState extends PostsStates {}

class PostsLoadingState extends PostsStates {}

class PostsSuccessState extends PostsStates {
  final List<dynamic> postsFromCubit;

  PostsSuccessState(this.postsFromCubit);
}

class PostsErrorState extends PostsStates {
  final error;
  PostsErrorState(this.error);
}
