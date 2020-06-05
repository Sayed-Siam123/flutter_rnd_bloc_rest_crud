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
  final _id = BehaviorSubject<String>();


  Stream<List<Posts>> get allPosts => _postsFetcher.stream;
  Stream<SinglePostModel> get singlePosts => _singlepostfetcher.stream;
  Function(String) get getId => _id.sink.add;


  fetchallPosts() async{

    List<Posts> posts = await _repository.fetchAllTodo();
    _postsFetcher.sink.add(posts);
  }

  getsinglepost() async{
    print("data:: "+_id.value);
    SinglePostModel singlepostdetail = await _repository.getsinglePost(_id.value);
    _singlepostfetcher.sink.add(singlepostdetail);
  }



  void dispose() async{
//    _title.close();
    _id.drain();
    //_id.close();
    await _postsFetcher.drain();
    _postsFetcher.close();
    await _singlepostfetcher.drain();
    _singlepostfetcher.close();
  }

}

final bloc = rnd_blocs();