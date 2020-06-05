import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rnd_bloc_rest_crud/ColorLibrary/HexColor.dart';
import 'package:flutter_rnd_bloc_rest_crud/widgets/Single_data_show_widget.dart';


class SingleGetData extends StatefulWidget {
  @override
  _SingleGetDataState createState() => _SingleGetDataState();
}

class _SingleGetDataState extends State<SingleGetData> {

  final Color _blackText = new HexColor("#212121");

  final Color _green = new HexColor("#00B341");

  final Color _grey = new HexColor("#9E9E9E");

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      //drawer: drawerWidget(),
      appBar: AppBar(
        backgroundColor: _green,
        title: Text(
            "Flutter RND with HTTP"
        ),
        centerTitle: true,
      ),

      //body: ListView_get(), //for showing get value from API

      body: Center(
        child: DataShowWidget(),
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
              Text("dkahdka"),
              Text("dkahdka"),
              Text("dkahdka"),

            ],
          ),
        ),
      ),

    );


//    return Container(
//      padding: EdgeInsets.only(top: 10,left: 15,right: 20),
//      margin: EdgeInsets.only(top: 0,right: 5,left: 0),
//      color: Colors.transparent,
//      child: Container(
//            width: 170,
//            margin: EdgeInsets.all(20),
//            padding: EdgeInsets.only(top: 10, left: 12),
//            color: Colors.white,
//      ),
//    );
  }
}
