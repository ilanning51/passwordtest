import 'package:flutter/material.dart';
import 'package:passwordtest/pages/login_widget.dart';
import 'package:passwordtest/pages/signup_widget.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin 
    ? LoginWidget(onClickedSignUp: toggle) 
    : SignupWidget(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
