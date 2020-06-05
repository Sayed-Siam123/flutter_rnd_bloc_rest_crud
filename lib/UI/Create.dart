import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rnd_bloc_rest_crud/ColorLibrary/HexColor.dart';
import 'package:flutter_rnd_bloc_rest_crud/widgets/CreateWidget.dart';
import 'package:flutter_rnd_bloc_rest_crud/widgets/drawerWidget.dart';

class CreatePage extends StatefulWidget {

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final Color _blackText = new HexColor("#212121");

  final Color _green = new HexColor("#00B341");

  final Color _grey = new HexColor("#9E9E9E");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(),
      appBar: AppBar(
        backgroundColor: _green,
        title: Text(
            "Flutter RND with HTTP"
        ),
        centerTitle: true,
      ),

      //body: ListView_get(), //for showing get value from API

      body: Center(
        child: CreateWidget(),
      ),

    );
  }
}
