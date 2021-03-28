import 'dart:convert';
import 'dart:io';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://60585b2ec3f49200173adcec.mockapi.io/api/v1';

  var client = new http.Client();
  var token;

  Future<User> getUserProfile(String userEmail) async {
    print("I am here");
    // Get user profile for id
    var response = await client.post(Uri.parse('$endpoint/login'));

    // Convert and return
    token = jsonDecode(response.body);
    User user = User();
    user.email = userEmail;
    user.token = token["token"];
    return user;
  }

  Future<List<Post>> getPostsForUser(String userToken) async {
    var posts = <Post>[];
    // Get user posts for id
    var response = await client.get(Uri.parse('$endpoint/blogs'),
        headers: {HttpHeaders.authorizationHeader: userToken});

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;
    print(parsed);
    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }
    return posts;
  }

  Future<Post> getSinglePostForUser(String userToken, String postId) async {
    var response = await client.get(Uri.parse('$endpoint/blogs/$postId'),
        headers: {HttpHeaders.authorizationHeader: userToken});

    var parsed = json.decode(response.body);
    print(parsed);

    return Post.fromJson(parsed);
  }
}
