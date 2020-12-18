import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_handle/layout/cubit/states.dart';
import 'package:rest_api_handle/post_repository.dart';

class HomeCubit extends Cubit<PostsStates> {
  PostRepository postRepository;
  HomeCubit(this.postRepository) : super(PostsInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List cubitPosts = [];

  getPosts() async {
    // change to loading
    emit(PostsLoadingState());

    // fetch the data from the API Direct Via Repository
    // Because the api extends the Repo (PolyMorphism)
    await postRepository.fetchData().then((postsFromApi) {
      // store the list inside a new one here
      cubitPosts = postsFromApi;

      // change the state
      // and send the list of data with it
      emit(PostsSuccessState(cubitPosts));
    }).catchError((onError) {
      // handel error
      emit(PostsErrorState(onError));
    });
  }
}
