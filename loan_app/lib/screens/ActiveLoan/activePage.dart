import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loan_app/Shared/Loading.dart';


class ActiveLoanPage extends StatefulWidget {
  final userUID;
  const ActiveLoanPage({super.key, required this.userUID});

  @override
  State<ActiveLoanPage> createState() => _ActiveLoanPageState();
}

class _ActiveLoanPageState extends State<ActiveLoanPage> {

  @override
  Widget build(BuildContext context) {

    final userDoc = Provider.of<QuerySnapshot?>(context);
    dynamic doc;
    bool hasLoan = true;
    final userFullName = FirebaseAuth.instance.currentUser?.displayName;
    userDoc?.docs.forEach((element) {
      if (element.id == widget.userUID){
        doc = element;
        hasLoan = element["hasLoan"];
      }
    });

    //widgets
    Widget ActiveLoanInformation = Center(
      child: Container(
        child: Text('Info Here...'),
      ),
    );

    Widget NoActiveLoans = Text("Dear $userFullName,\n\nThis message is to inform you that there are no active loans associated with your account at this time. If you have any questions or require further information, feel free to contact our customer service team.\nThank you for your understanding.\n\nSincerely,\nJhinga Corporation");

    if(userDoc == null){
      return Container(
        height: 400,
        child: const AlertDialog(
          title: Text('Current Loan'),
          content: Loading(),
        ),
      );
    }else{
      return Container(
      child: AlertDialog(
        title: const Text("Current Loan"),
        content: hasLoan ? ActiveLoanInformation : NoActiveLoans,
        actions: [
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context, 'Close'),
            ),
          ],
      ),
    );
    }
  }
}
