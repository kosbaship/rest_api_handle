import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_handle/layout/cubit/states.dart';
import 'package:rest_api_handle/network/api_helper.dart';

class HomeCubit extends Cubit<PostsStates> {
  HomeCubit() : super(PostsInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List cubitPosts = [];

  getPosts() async {
    if (cubitPosts.length == 0) {
      // change to loading
      emit(PostsLoadingState());

      // fetch the data from the API Direct
      await DioHelper.fetchData().then((response) {
        // store the list inside a new one here
        cubitPosts = response;

        // change the state
        emit(PostsSuccessState());
      }).catchError((onError) {
        // handel error
        emit(PostsErrorState(onError));
      });
    }
  }
}
