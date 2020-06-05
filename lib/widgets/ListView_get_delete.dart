import 'dart:async';
import 'package:flutter_rnd_bloc_rest_crud/ColorLibrary/HexColor.dart';
import 'package:flutter_rnd_bloc_rest_crud/blocs/crud_blocs.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/Posts_Model.dart';
import 'package:flutter_rnd_bloc_rest_crud/widgets/Single_data_show_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ListView_get extends StatefulWidget {
  @override
  _ListView_getState createState() => _ListView_getState();
}

// ignore: camel_case_types
class _ListView_getState extends State<ListView_get> {

  void initState() {
    bloc.fetchallPosts();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }


  //final String URL = "https://test.bluesden.co/api/posts";

  final Color _blackText = new HexColor("#212121");

  //final Color _green = new HexColor("#00B341");

  final Color _grey = new HexColor("#9E9E9E");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backButtonPressed,
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 15, right: 20),
        margin: EdgeInsets.only(top: 0, right: 5, left: 0),
        color: Colors.transparent,
        child: StreamBuilder<List<Posts>>(
          stream: bloc.allPosts,
          builder: (context, AsyncSnapshot<List<Posts>> snapshot) {
            if (snapshot.hasData) {
              List<Posts> data = snapshot.data;
              print("Data gula:: ");
              print(data.length);
              return _get_list_view(data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );

//          Expanded(
//              child: ListView.builder(
//                  scrollDirection: Axis.vertical,
//                  itemCount: 10,
//                  itemBuilder: (BuildContext context, int index) {
//                    return Container(
//                      width: 170,
//                      margin: EdgeInsets.all(10),
//                      padding: EdgeInsets.only(top: 10,left: 12),
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.all(Radius.circular(15)),
//                        boxShadow: [
//                          BoxShadow(
//                              blurRadius: 15.0,
//                              //spreadRadius: 3.0,
//                              color: Colors.grey.shade400
//                          ),
//                        ],
//                      ),
//                      child: Padding(
//
//                        padding: EdgeInsets.symmetric(
//                            vertical: 0.0,
//                            horizontal: 0.0
//                        ),
//
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
////                          Text(device_list[index].device_name,
////                            style: TextStyle(
////                              fontSize: 14.0,
////                              fontWeight: FontWeight.bold,
////                              letterSpacing: 1.2,
////                            ),
////                          ),
//                            CircleAvatar(
//                              radius: 20,
//                              backgroundColor: Colors.transparent,
//                              backgroundImage: AssetImage('assets/facebook.png'),
//                            ),
//
//                            Text("asche",
//                              style: TextStyle(
//                                color: _blackText,
//                                fontSize: 14.0,
//                                fontWeight: FontWeight.bold,
//                                letterSpacing: 1.2,
//                              ),
//                            ),
//                            Text("Asche",
//                              style: TextStyle(
//                                color: _grey,
//                                fontSize: 14.0,
//                                //fontWeight: FontWeight.bold,
//                                letterSpacing: 1.2,
//                              ),
//                            ),
//
//                            InkWell(
//                              onTap: (){
//                                debugPrint("Asche");
//                              },
//                              child: CircleAvatar(
//                                radius: 17,
//                                backgroundColor: Colors.transparent,
//                                backgroundImage: AssetImage('assets/facebook.png'),
//                              ),
//                            ),
//
//                          ],
//                        ),
//                      ),
//                    );
//                  }
//              ),
//            ),
  }

  Future<bool> _backButtonPressed(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  bloc.dispose();
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  ListView _get_list_view(data) {
    final Color _widgetbackgroundWhite = new HexColor("#FFFFFF");
    //final Color _green = new HexColor("#00B341");

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          //return _tile(data[index].name, data[index].posts, Icons.work);
          return Container(
            width: 170,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.only(top: 10, left: 12),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data[index].id.toString(),
                        style: TextStyle(
                          color: _blackText,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        data[index].name,
                        style: TextStyle(
                          color: _blackText,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        data[index].posts,
                        style: TextStyle(
                          color: _grey,
                          fontSize: 14.0,
                          //fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          debugPrint(data[index].id.toString());
                        },
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/facebook.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 100,
                      margin: EdgeInsets.only(right: 11),
                      child: RaisedButton(
                        color: _blackText,
                        onPressed: () {
                          print("Paisi");
                          debugPrint("post ID :: " + data[index].id.toString());
                          bloc.getId(data[index].id.toString());
                          bloc.getsinglepost();
/*
                          final postsData = new Posts(
                              id: data[index].id,
                              name: data[index].name,
                              posts: data[index].posts);
*/

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DataShowWidget()));
                        },
                        child: Text(
                          "View Data",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 20,
                      width: 100,
                      margin: EdgeInsets.only(right: 11),
                      child: RaisedButton(
                        color: _blackText,
                        onPressed: () {
                          print("Paisi");
                          debugPrint(data[index].id.toString());
                          Navigator.of(context).pushNamed('/single_get_data');
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 20,
                      width: 100,
                      margin: EdgeInsets.only(right: 11),
                      child: RaisedButton(
                        color: _blackText,
                        onPressed: () async {
                          print("Paisi");
                          debugPrint(data[index].id.toString());

                          bloc.getId(data[index].id.toString());
                          bloc.deletePost();

                          //deleteData(data[index].id);

                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Processing Data'),
                            duration: Duration(seconds: 2),
                          ));

                          new Timer(const Duration(seconds: 2), () {
                            bloc.dispose();
                            bloc.fetchallPosts();
                            Navigator.of(context).pushNamed('/index');
                          });

                          //Navigator.of(context).pushNamed('/single_get_data');
                        },
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
