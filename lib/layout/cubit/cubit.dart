import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_handle/layout/cubit/states.dart';

class HomeCubit extends Cubit<PostsStates> {
  HomeCubit() : super(PostsInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List cubitPosts = [];

  getPosts() async {
    if (cubitPosts.length == 0) {
      // change to loading
      emit(PostsLoadingState());

      Dio dio = Dio();
      dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';

      // fetch the data from the API Direct
      await dio.get('posts').then((response) {
        // store the list inside a new one here
        cubitPosts = response.data as List;

        // change the state
        emit(PostsSuccessState());
      }).catchError((onError) {
        // handel error
        emit(PostsErrorState(onError));
      });
    }
  }
}
