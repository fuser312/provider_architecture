import 'package:flutter/foundation.dart';
import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';


class LoginModel extends BaseModel{
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userEmailText, String passwordIdText) async {
    setState(ViewState.Busy);
    var userIdEmail = userEmailText;
    var passwordId = passwordIdText;
    if(userIdEmail.length == 0 || passwordId.length == 0 ){
      print("I am here");
      errorMessage = "You can't leave input fields blank";
      setState(ViewState.Idle);
      return false;
    }
    var success = await _authenticationService.login(userIdEmail);
    setState(ViewState.Idle);
    return success;
  }

}