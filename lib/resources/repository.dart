import 'package:flutter_rnd_bloc_rest_crud/models/Posts_Model.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/single_post_model.dart';
import 'package:flutter_rnd_bloc_rest_crud/resources/apiprovider.dart';

class Repository{
  final apiprovider = ApiProvider();

  Future<List<Posts>> fetchAllTodo() => apiprovider.fetchPosts();
  Future<SinglePostModel> getsinglePost(String id) => apiprovider.fetchsingledata(id);

}