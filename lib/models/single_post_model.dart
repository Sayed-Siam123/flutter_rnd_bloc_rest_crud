class SinglePostModel {
  final int id;
  final String name;
  final String posts;

  SinglePostModel({this.id, this.name, this.posts});

  factory SinglePostModel.fromJson(Map<String, dynamic> json) {
    return SinglePostModel(
      id: json['id'],
      name: json['name'],
      posts: json['posts'],
    );
  }

}