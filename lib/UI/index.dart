import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rnd_bloc_rest_crud/ColorLibrary/HexColor.dart';
import 'package:flutter_rnd_bloc_rest_crud/blocs/crud_blocs.dart';
import 'package:flutter_rnd_bloc_rest_crud/widgets/ListView_get_delete.dart';
import 'package:flutter_rnd_bloc_rest_crud/widgets/drawerWidget.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  void initState() {
    bloc.fetchallPosts();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

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
          child: ListView_get(),
      ),

      bottomNavigationBar:
      Container(
        height: 70,
        width: 100,
        child: BottomAppBar(
          color: _green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(

                onTap: (){
                  debugPrint("ADD NEW POSTS");
                  Navigator.of(context).pushNamed('/create');

                },

                child: Text(
                    "Add New Posts",
                style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                   ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
