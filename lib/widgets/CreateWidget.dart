import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rnd_bloc_rest_crud/ColorLibrary/HexColor.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/Create_model.dart';
import 'package:http/http.dart' as http;


class CreateWidget extends StatefulWidget {
  @override
  _CreateWidgetState createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  final _formKey = GlobalKey<FormState>();

  Future<Create_model> create_model;

  @override
  Widget build(BuildContext context) {
    final Color _widgetbackgroundWhite = new HexColor("#FFFFFF");
    final Color _green = new HexColor("#00B341");

    final TextEditingController name = TextEditingController();
    final TextEditingController posts = TextEditingController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 0, left: 0, right: 0),
        margin: EdgeInsets.only(top: 0, right: 0, left: 0),
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: 340,
          margin: EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 0),
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
          child: Container(
            child: (create_model == null) ?
            Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Name',
                        ),

                        controller: name,

                      ),

                      SizedBox(height: 23,),

                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Post',
                        ),

                        controller: posts,

                      ),

//                      RaisedButton(
//                        child: Text('Create Data'),
//                        onPressed: () {
//                          setState(() {
//                            print("asasasasasas");
//                            create_model = createPost(name.text, posts.text);
//                          });
//                        },
//                      ),

                    ],
                  ),
                )
//                    : FutureBuilder<Create_model>(
//                  future: create_model,
//                  builder: (context, snapshot) {
//                    if (snapshot.hasData) {
//                      print("Asche snap e");
//                      setState(() {
//                        Scaffold.of(context).showSnackBar(
//                            SnackBar(content: Text(snapshot.data.id.toString())));
//                      });
//                      //return Text(snapshot.data.name);
//                    } else if (snapshot.hasError) {
//                      return Text("${snapshot.error}");
//                    }
//                    return CircularProgressIndicator();
//                  },
//                ),
              ],
            )

          : Container(
              child: FutureBuilder<Create_model>(
                future: create_model,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print("Asche snap e");
                    print(snapshot.data.posts.toString());
                    return Text(snapshot.data.id.toString());
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),

          ),
        ),
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

                onTap: () {
                  debugPrint("ADD NEW POSTS");
                  if (_formKey.currentState.validate()) {

//                    createPost(name.text, posts.text);
                  setState(() {
                    createPost(name.text, posts.text);

                  });

                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data'),
                        duration: Duration(seconds: 2),));

                  new Timer(const Duration(seconds: 2), () {

                  Navigator.of(context).pushNamed('/index');

                 });
               }


            },

                child: Text(
                  "Submit",
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

  Future<Create_model> createPost(String name, String posts) async {
    final http.Response response = await http.post(
      'https://test.bluesden.co/api/posts',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'posts': posts,
      }),
    );
    if (response.statusCode == 201) {

      print(json.decode(response.body));

      //Navigator.of(context).pushNamed('/index');

      //return Create_model.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
