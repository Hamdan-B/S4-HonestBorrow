import 'package:flutter/material.dart';
import 'package:loan_app/screens/Authenticate/SignIn.dart';
import 'package:loan_app/screens/Authenticate/Signup.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  //Variables
  bool showSignInForm = true;

  //Functions
  void ToggleView(){
    setState(() {
      showSignInForm = !showSignInForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignInForm){
      return SignIn(ToggleView: ToggleView);
    }else{
      return SignUp(ToggleView: ToggleView);
    }
  }
}