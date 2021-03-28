import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/viewmodels/post_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/postlist_item.dart';

class PostView extends StatelessWidget {
  final String postId;
  PostView({this.postId});

  @override
  Widget build(BuildContext context) {
    return BaseView<PostModel>(
      onModelReady: (model) =>
          model.getPosts(Provider.of<User>(context).token, postId),
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UIHelper.verticalSpaceLarge(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Welcome ${Provider.of<User>(context).email}',
                          style: headerStyle1,
                        ),
                      ),
                      UIHelper.verticalSpaceSmall(),
                      PostListItem(
                        post: model.post,
                      ),
                    ],
                  ),
              )),
    );
  }
  // Widget getPostUi(List<Post> posts) => ListView.builder(
  //   itemCount: posts.length,
  //   itemBuilder: (context, index) => PostListItem(
  //     post: posts[index],
  //     onTap: () {
  //       Navigator.pushNamed(context, '/post', arguments: posts[index]);
  //     },
  //   ),
  // );
}
