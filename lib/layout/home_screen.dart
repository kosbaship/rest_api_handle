import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_handle/layout/cubit/cubit.dart';
import 'package:rest_api_handle/model/post_model.dart';

import 'cubit/states.dart';

List<PostModel> renderPosts = List<PostModel>();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // this is the server request
    HomeCubit.get(context).getPosts();

    return BlocConsumer<HomeCubit, PostsStates>(
      listener: (context, state) {
        if (state is PostsLoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Loading'),
          ));
        }
        if (state is PostsSuccessState) {
          // read the List of posts and parse it from cubit through Successful state
          renderPosts = state.postsFromCubit
              .map((json) => PostModel.fromJson(json))
              .toList();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Perform GET Request"),
            centerTitle: true,
          ),
          body: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: renderPosts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Text("UID ${renderPosts[index].userId}"),
                  title: Text(
                    renderPosts[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    renderPosts[index].body,
                  ),
                  trailing: Text("Pid ${renderPosts[index].id}"),
                  onTap: () {
                    print("Hello From Terminal I am Item Number ${index + 1}");
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
          ),
        );
      },
    );
  }
}
