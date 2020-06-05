import 'package:flutter/material.dart';
import 'package:flutter_rnd_bloc_rest_crud/UI/Create.dart';
import 'package:flutter_rnd_bloc_rest_crud/UI/Single_get_data.dart';
import 'package:flutter_rnd_bloc_rest_crud/UI/index.dart';
import 'package:flutter_rnd_bloc_rest_crud/UI/login.dart';
import 'package:flutter_rnd_bloc_rest_crud/UI/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,


      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),       //for routing pages
        '/index': (BuildContext context) => new IndexPage(),
        '/single_get_data': (BuildContext context) => new SingleGetData(),
        '/create': (BuildContext context) => new CreatePage(),
      },

      home: new LoginPage(),
    );
  }
}