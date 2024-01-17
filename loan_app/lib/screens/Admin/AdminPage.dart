import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:loan_app/services/auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final AuthService _auth = AuthService();
  final userInfoTable = FirebaseDatabase.instance.ref('UserInfo');
  final ReqLoansTable = FirebaseDatabase.instance.ref('RequestedLoans');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () async {
              try {
                await _auth.signOut();
              } catch (e) {
                print(e.toString());
              }
            },
          )
        ],
      ),
      body: FirebaseAnimatedList(
        query: ReqLoansTable,
        itemBuilder: (context, snapshot, animation, index) {
          return ListTile(
            title: ElevatedButton(
              child: Text(snapshot.child('fullname').value.toString()),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(snapshot.child('fullname').value.toString()),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: Text("Total: ${snapshot.child('amount').value}")),
                          Flexible(child: Text("No. Of Months: ${snapshot.child('noOfMonths').value}")),
                          Flexible(child: Text("Payment Per Month: ${snapshot.child('repaymentAmount').value}")),
                          Flexible(child: Text("Requested On: ${snapshot.child('RequestedDate').value}")),
                          Flexible(child: Text("Est Date: ${snapshot.child('EstDate').value}")),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                         child: Text('Reject'), 
                         onPressed: () {
                          userInfoTable.child(snapshot.key.toString()).child('hasReqLoan').set(false);
                          ReqLoansTable.child(snapshot.key.toString()).remove();
                          Navigator.pop(context);
                         },
                        ),
                        ElevatedButton(
                         child: Text('Approve'), 
                         onPressed: () {
                          userInfoTable.child(snapshot.key.toString()).child('hasLoan').set(true);
                          ReqLoansTable.child(snapshot.key.toString()).remove();
                          Navigator.pop(context);
                         },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
