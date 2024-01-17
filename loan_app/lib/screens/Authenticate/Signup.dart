import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loan_app/Shared/Loading.dart';
import 'package:loan_app/Shared/constants.dart';
import 'package:loan_app/screens/Authenticate/Authenticate.dart';
import 'package:loan_app/services/auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

class SignUp extends StatefulWidget {
  final Function ToggleView;

  const SignUp({super.key, required this.ToggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  bool loading = false;

  String? emailInput, passInput, fullname;

  FilePickerResult? cnicFrontResult;
  FilePickerResult? cnicBackResult;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              elevation: 0.0,
              title: const Text('Sign Up'),
            ),
            body: Column(
              children: [
                Container(
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: inputTextDecoration.copyWith(
                              labelText: 'Full Name'),
                          validator: (value) {
                            setState(() {
                              fullname = value;
                            });
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration:
                              inputTextDecoration.copyWith(labelText: 'Email'),
                          validator: (value) {
                            setState(() {
                              emailInput = value;
                            });
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: inputTextDecoration.copyWith(
                              labelText: 'Password'),
                          //autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            setState(() {
                              passInput = value;
                            });
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                )
                              ),
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                child: Text('CNIC FRONT'),
                                onPressed: () async {
                                  cnicFrontResult =
                                      await FilePicker.platform.pickFiles();
                                  if (cnicFrontResult != null) {
                                    print('File selected');
                                  } else {
                                    print("No file selected");
                                  }
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                )
                              ),
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                child: Text('CNIC BACK'),
                                onPressed: () async {
                                  cnicBackResult =
                                      await FilePicker.platform.pickFiles();
                                  if (cnicBackResult != null) {
                                    print('File Selected');
                                  } else {
                                    print("No file selected");
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text('Sign up'),
                    onPressed: () async {
                      File cnicFrontPath = File(cnicFrontResult?.files.single.path ?? 'none');
                      if (_signUpFormKey.currentState!.validate()) {
                        setState(() => loading = true);
                        FirebaseStorage.instance.ref('CNIC').putFile(cnicFrontPath);
                        dynamic _result = await _authService.registerEmail(
                            emailInput ?? 'None',
                            passInput ?? 'None',
                            fullname ?? 'None');
                        // setState(() => loading = false);
                        Authenticate();
                        if (_result == null) {
                          print("Please Enter valid credentials!");
                          setState(() => loading = false);
                        }
                      }
                    },
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text('Login Page'),
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
