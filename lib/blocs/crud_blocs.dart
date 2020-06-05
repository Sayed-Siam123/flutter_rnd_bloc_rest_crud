import 'package:flutter_rnd_bloc_rest_crud/models/Create_model.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/Posts_Model.dart';
import 'package:flutter_rnd_bloc_rest_crud/models/single_post_model.dart';
import 'package:flutter_rnd_bloc_rest_crud/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

// ignore: camel_case_types
class rnd_blocs{
  final _repository = Repository();
  final _postsFetcher = PublishSubject<List<Posts>>();
  // ignore: close_sinks
  final _singlepostfetcher = PublishSubject<SinglePostModel>();
  final _postDatafetcher = PublishSubject<Create_model>();
  final _id = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _posts = BehaviorSubject<String>();


  Stream<List<Posts>> get allPosts => _postsFetcher.stream;
  Stream<SinglePostModel> get singlePosts => _singlepostfetcher.stream;
  Stream<Create_model> get postsData => _postDatafetcher.stream;

  Function(String) get getId => _id.sink.add;
  Function(String) get getName => _name.sink.add;
  Function(String) get getPosts => _posts.sink.add;


  fetchallPosts() async{

    List<Posts> posts = await _repository.fetchAllTodo();
    _postsFetcher.sink.add(posts);
  } //GET

  getsinglepost() async{
    print("data:: "+_id.value);
    SinglePostModel singlepostdetail = await _repository.getsinglePost(_id.value);
    _singlepostfetcher.sink.add(singlepostdetail);
  } //GET_BY_ID

  createPost() async{
    print("data:: "+_name.value+" "+_posts.value);
    Create_model postsData = await _repository.createPost(_name.value, _posts.value);
    //_repository.createPost(_name.value, _posts.value);
    _postDatafetcher.sink.add(postsData);
  } //POST

  deletePost() async{
    print(_id.value);
    _repository.deletePost(_id.value);
  }





  void dispose() async{
//    _title.close();
    _id.drain();
    _name.drain();
    _posts.drain();
    //_id.close();
    await _postsFetcher.drain();
    _postsFetcher.close();
    await _singlepostfetcher.drain();
    _singlepostfetcher.close();
    await _postDatafetcher.drain();
    _postDatafetcher.close();
  }

}

final bloc = rnd_blocs();