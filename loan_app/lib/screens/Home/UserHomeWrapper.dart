import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loan_app/Models/UserObj.dart';
import 'package:loan_app/Shared/Loading.dart';
import 'package:loan_app/screens/Home/UserReqLoanPage.dart';
import 'package:loan_app/screens/Profile/profile.dart';

class UserHomeWrapper extends StatefulWidget {
  final UserObj user;
  const UserHomeWrapper({super.key, required this.user});

  @override
  State<UserHomeWrapper> createState() => _UserHomeWrapperState();
}

class _UserHomeWrapperState extends State<UserHomeWrapper> {
  @override
  Widget build(BuildContext context) {
    final UserInfoNode = FirebaseDatabase.instance
        .ref('UserInfo')
        .child(widget.user.uid.toString());

    return StreamBuilder(
      stream: UserInfoNode.onValue,
      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.snapshot.child('hasReqLoan').value as bool) {
            print('userloaninfo page');
            return profile(userUID: widget.user.uid);
          } else {
            return UserReqLoan(user: widget.user);
          }
        } else {
          print('Loading');
          return Loading();
        }
      },
    );
  }
}
