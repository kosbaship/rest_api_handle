import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/cubit.dart';
import 'layout/home_screen.dart';
import 'network/api_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeCubit(ApiProvider()),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            home: HomePage()));
  }
}
