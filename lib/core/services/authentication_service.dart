import 'dart:async';

import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/locator.dart';
import 'api.dart';
class AuthenticationService{
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();
  Future<bool> login(String userEmail) async {
    var fetchedUser = await _api.getUserProfile(userEmail);
    var hasUser = fetchedUser != null;

    if(hasUser){
      userController.add(fetchedUser);
    }
    return hasUser;
  }
}