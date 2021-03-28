import 'package:provider_architecture/core/models/post.dart';

class User {
  String token;
  String email;
  List<Post> userPosts;
  User({this.token, this.email, this.userPosts});

  User.initial()
      : token = "",
        email = '';

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}