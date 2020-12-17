/*import 'package:dio/dio.dart';
import 'package:rest_api_handle/model/post_model.dart';

class DioHelper {
  var dataSourcePosts = List<PostModel>();

  Future<List<PostModel>> fetchData() async {
    try {
      Dio dio = Dio();
      dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
      await dio.get('posts').then((value) {
        dataSourcePosts = (value.data as List)
            .map((json) => PostModel.fromJson(json))
            .toList();
      });
    } catch (error) {
      print(error);
    }
    return dataSourcePosts;
  }
}*/
