import 'package:dio/dio.dart';
import 'package:rest_api_handle/post_repository.dart';

class ApiProvider implements PostRepository {
  var dataSourcePosts = [];

  // static DioHelper get = DioHelper();

  @override
  Future<List<dynamic>> fetchData() async {
    try {
      Dio dio = Dio();
      dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';

      // fetch the data from the API Direct
      await dio.get('posts').then((response) {
        // store the list inside a new one here
        dataSourcePosts = response.data as List;
      });
    } catch (error) {
      print(error);
    }
    return dataSourcePosts;
  }
}
