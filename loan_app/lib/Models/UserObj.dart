class UserObj{
  final String? uid, mail;

  UserObj({ this.uid , this.mail});

}

class UserData{
  final String name,
               accStatus,
               hasLoan,
               reqLoan;

  UserData({
    required this.name,
    required this.accStatus,
    required this.hasLoan,
    required this.reqLoan
  });
}