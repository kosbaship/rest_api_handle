import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


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
          // itemCount: _posts.length,
          itemCount: 25,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                // leading: Text("UID ${_posts[index].userId}"),
                leading: Text("UID"),
                title: Text(
                  // _posts[index].title,
                  "title",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  // _posts[index].body,
                  "body",
                ),
                // trailing: Text("Pid ${_posts[index].id}"),
                trailing: Text("pid"),
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
