import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/Create_model.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/Posts_Model.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/single_post_model.dart';
import 'package:http/http.dart' show Client;



class ApiProvider{
  Client client = Client();
  final _url = "https://test.bluesden.co/api/posts/";

  Future<List<Posts>> fetchPosts() async{
    print("fetch from apiprovider");
    final response = await client.get(_url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      debugPrint("From Get Class:: "+jsonResponse.toString());

      return jsonResponse.map((posts) => new Posts.fromJson(posts)).toList();



    } else {
      throw Exception('Failed to load jobs from API');
    }

  }

  Future<SinglePostModel> fetchsingledata(id) async{

    final response =
    await client.get(_url+id);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.


      debugPrint("From singleGet Class:: "+json.decode(response.body).toString());
      return SinglePostModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Create_model> createPost(name,posts) async {
    //print("1");
    final response = await client.post(
      'https://test.bluesden.co/api/posts',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'posts': posts,
      }),
    );
    //print("1");
    if (response.statusCode == 201) {

      print(json.decode(response.body));

      //Navigator.of(context).pushNamed('/index');

      //return Create_model.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future deletePost(id) async {

    final response = await client.delete(
        '$_url'+'$id',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print("data deleted");
        //return Posts.fromJson(jsonDecode(response.body));
      } else {

        throw Exception('Failed to delete album.');
      }
    }

  }