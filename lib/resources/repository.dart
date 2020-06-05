import 'package:flutter_rnd_bloc_rest_crud/models/Create_model.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/Posts_Model.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/single_post_model.dart';
import 'package:flutter_rnd_bloc_rest_crud/resources/apiprovider.dart';

class Repository{
  final apiprovider = ApiProvider();

  Future<List<Posts>> fetchAllTodo() => apiprovider.fetchPosts(); //GET
  Future<SinglePostModel> getsinglePost(String id) => apiprovider.fetchsingledata(id); //GET_BY_ID
  Future<Create_model> createPost(String name,String posts) => apiprovider.createPost(name,posts); //POST
  Future deletePost(String id) => apiprovider.deletePost(id); //DELETE
}