abstract class PostsStates {}

class PostsInitialState extends PostsStates {}

class PostsLoadingState extends PostsStates {}

class PostsSuccessState extends PostsStates {}

class PostsErrorState extends PostsStates {
  final error;
  PostsErrorState(this.error);
}
