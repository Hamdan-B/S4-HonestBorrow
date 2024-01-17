import 'package:flutter/material.dart';
import 'package:loan_app/Models/UserObj.dart';
import 'package:loan_app/screens/Authenticate/Authenticate.dart';
import 'package:loan_app/screens/Admin/AdminPage.dart';
import 'package:loan_app/screens/Home/UserHomeWrapper.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserObj?>(context);

   if(user != null){
    if(user.mail == 'admin@mail.com'){
      return AdminPage();
    }else{
      return UserHomeWrapper(user: user,);
    }
    
   }else{
    return Authenticate();
   }
    
  }
}