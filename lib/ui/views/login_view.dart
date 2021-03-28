import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeader(
                controller: _controller,
                passwordController: _passwordController,
                validationMessage: model.errorMessage,
              ),
              model.state == ViewState.Busy ?
                CircularProgressIndicator()
              : TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,
                ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                onPressed: () async {
                  var loginSuccess = await model.login(_controller.text, _passwordController.text);
                  if(loginSuccess){
                      Navigator.pushNamed(context, '/');
                  }
                },
              ),
            ],
          ),
        ),
      );

  }
}