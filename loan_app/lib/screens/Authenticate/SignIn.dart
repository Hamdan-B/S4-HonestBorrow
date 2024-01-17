import 'package:flutter/material.dart';
import 'package:loan_app/Shared/Loading.dart';
import 'package:loan_app/Shared/constants.dart';
import 'package:loan_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function ToggleView;

  const SignIn({super.key, required this.ToggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  bool loading = false;

  String? emailInput, passInput;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return loading? const Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: const Text('Sign In'),
      ),
      body: Column(
        children: [
          Container(
            child: Form(
              key: _signInFormKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: inputTextDecoration.copyWith(labelText: 'Email'),
                    validator: (value) {
                      setState(() {
                        emailInput = value;
                      });
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: inputTextDecoration.copyWith(labelText: 'Password'),
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      setState(() {
                        passInput = value;
                      });
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              child: const Text('Sign in'),
              onPressed: () async {
                if (_signInFormKey.currentState!.validate()) {
                  setState(() => loading = true);
                  dynamic result = await _authService.signInEmail(
                      emailInput ?? 'None', passInput ?? 'None');
                  if (result == null) {
                    print('Error Signing In');
                    setState(() => loading = false);
                  } else {
                    print('Signed In');
                    print(result.uid);
                  }
                }
              },
            ),
          ),
          Container(
            child: ElevatedButton(
              child: Text('Create Account'),
              onPressed: () {
                widget.ToggleView();
              },
            ),
          ),
        ],
      ),
    );
  }
}
