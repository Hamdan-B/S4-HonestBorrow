import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  final UserInfoNode = FirebaseDatabase.instance.ref('UserInfo');
  final RequestedLoansNode = FirebaseDatabase.instance.ref('RequestedLoans');

  Future updateUserData(String uid, String fullname, String accountStatus,
      bool hasLoan, bool hasReqLoan) async {
    return await UserInfoNode.child(uid).set({
      'fullname': fullname,
      'accountStatus': accountStatus,
      'hasLoan': hasLoan,
      'hasReqLoan': hasReqLoan,
    });
  }

    Future reqLoan(String uid, String fullname, int amount,
      int noOfMonths, double repaymentAmount, String currentDate, String estDate) async {
        await UserInfoNode.child(uid).child('hasReqLoan').set(true);
    return await RequestedLoansNode.child(uid).set({
      'fullname': fullname,
      'amount': amount,
      'noOfMonths': noOfMonths,
      'repaymentAmount': repaymentAmount,
      'RequestedDate': currentDate,
      'EstDate': estDate, 
    });
  }
}
