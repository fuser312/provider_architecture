import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class PostModel extends BaseModel {
  Api _api = locator<Api>();

  Post post;

  Future getPosts(String userToken, String postId) async {
    setState(ViewState.Busy);
    post = await _api.getSinglePostForUser(userToken, postId);
    setState(ViewState.Idle);
  }
}
