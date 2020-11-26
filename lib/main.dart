import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'model/post_model.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> _posts = List<PostModel>();

  Future<List<PostModel>> fetchData () async {
    var posts = List<PostModel>();

    var url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);

    if (response.statusCode == 200){
      var postsJsonObject = convert.json.decode(response.body);
      for(var post in postsJsonObject){
        posts.add(PostModel.fromJson(post));
      }
    }
    return posts;
  }

  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        _posts.addAll(value);
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perform GET Request"),
          centerTitle: true,
        ),
        body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: _posts.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Text("UID ${_posts[index].userId}"),
                title: Text(
                  _posts[index].title,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  _posts[index].body,
                ),
                trailing: Text("Pid ${_posts[index].id}"),
                onTap: (){
                  print("Hello From Terminal I am Item Number ${index+1}");
                },
              ),
            );

          },
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }
}
