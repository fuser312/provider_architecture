import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;
  final TextEditingController passwordController;

  LoginHeader(
      {@required this.controller,
      this.validationMessage,
      this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Login', style: headerStyle),
      UIHelper.verticalSpaceMedium(),
      LoginPasswordTextField(
          controller: controller, isPass: false, hint: "User Email"),
      UIHelper.verticalSpaceMedium(),
      LoginPasswordTextField(
          controller: passwordController, isPass: true, hint: "Enter password"),
      this.validationMessage != null
          ? Text(validationMessage, style: TextStyle(color: Colors.red))
          : Container()
    ]);
  }
}

class LoginPasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPass;
  LoginPasswordTextField({
    this.controller,
    this.hint,
    this.isPass,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
          obscureText: isPass,
          decoration: InputDecoration.collapsed(hintText: hint),
          controller: controller),
    );
  }
}
