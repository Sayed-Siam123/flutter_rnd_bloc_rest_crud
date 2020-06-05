// ignore: camel_case_types
class Create_model{

  final int id;
  final String name;
  final String posts;


  Create_model({this.id, this.name,this.posts});

  factory Create_model.fromJson(Map<String, dynamic> json) {
    return Create_model(
      id: json['id'],
      name: json['title'],
      posts: json['posts'],
    );
  }

}