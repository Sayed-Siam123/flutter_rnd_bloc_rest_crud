class Posts{
  final int id;
  final String name;
  final String posts;

  Posts({this.id,this.name,this.posts});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      name: json['name'],
      posts: json['posts'],
    );
  }

}