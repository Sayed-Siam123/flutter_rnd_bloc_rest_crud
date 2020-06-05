import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rnd_bloc_rest_crud/ColorLibrary/HexColor.dart';
import 'package:flutter_rnd_bloc_rest_crud/blocs/crud_blocs.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/Posts_Model.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/single_post_model.dart';
import 'package:http/http.dart' as http;

class DataShowWidget extends StatefulWidget {
  @override
  _DataShowWidgetState createState() => _DataShowWidgetState();
}

class _DataShowWidgetState extends State<DataShowWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color _widgetbackgroundWhite = new HexColor("#FFFFFF");
    final Color _green = new HexColor("#00B341");

    return Scaffold(
      body: WillPopScope(
        onWillPop: _backButtonPressed,
        child: Container(
          padding: EdgeInsets.only(top: 0, left: 0, right: 0),
          margin: EdgeInsets.only(top: 0, right: 0, left: 0),
          color: Colors.white,
          child: Container(
            width: double.infinity,
            height: 340,
            margin: EdgeInsets.only(left: 15, right: 15, top: 110, bottom: 0),
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: _widgetbackgroundWhite,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15.0,
                    //spreadRadius: 3.0,
                    color: Colors.grey.shade400),
              ],
            ),
            child: StreamBuilder<SinglePostModel>(
              stream: bloc.singlePosts,
              builder: (context, AsyncSnapshot<SinglePostModel> snapshot) {
                if (snapshot.hasData) {
                  print("Data porer gula:: ");
                  print(snapshot.data.name);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "ID",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data.id.toString(),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "POST",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data.posts,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "NAME",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data.name,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(child: CircularProgressIndicator());
              },
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text("ID",
//                style: TextStyle(
//                  fontSize: 24,
//                  fontWeight: FontWeight.bold,
//                ),),
//              Text('${post.id}',
//                style: TextStyle(
//                  fontSize: 12,
//
//                ),),
//              SizedBox(height: 30,),
//              Text("POST",
//                style: TextStyle(
//                  fontSize: 24,
//                  fontWeight: FontWeight.bold,
//                ),),
//              Text('${post.posts}',
//                style: TextStyle(
//                  fontSize: 12,
//                ),),
//              SizedBox(height: 30,),
//              Text("NAME",
//                style: TextStyle(
//                  fontSize: 24,
//                  fontWeight: FontWeight.bold,
//                ),),
//              Text('${post.name}',
//                style: TextStyle(
//                  fontSize: 12,
//                ),),
//              Spacer(),
//            ],
//          ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _backButtonPressed() {
    print("back frm single");
    bloc.dispose();
    bloc.fetchallPosts();
    Navigator.of(context).pop(true);
  }

  /*Future<SinglePostModel> fetchAlbum() async {
    final response =
    await http.get('https://test.bluesden.co/api/posts/${widget.post.id}');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SinglePostModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }*/
}
