import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loan_app/Shared/Background.dart';
import 'package:loan_app/Shared/Loading.dart';

import 'package:firebase_database/firebase_database.dart';

class profile extends StatefulWidget {
  final userUID;
  const profile({super.key, required this.userUID});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final _foregroundColor = Color.fromARGB(255, 90, 79, 239);
  @override
  Widget build(BuildContext context) {
    var m_size = MediaQuery.of(context).size;
    final UserInfoNode = FirebaseDatabase.instance
        .ref('UserInfo')
        .child(widget.userUID.toString());
    return StreamBuilder(
        stream: UserInfoNode.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Background(
                child: Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: m_size.height * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: m_size.height * 0.15,
                            //color: Colors.yellow,
                            alignment: Alignment.center,
                            width: m_size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.logout),
                                  iconSize: 30,
                                  color: _foregroundColor,
                                  onPressed: () =>
                                      {FirebaseAuth.instance.signOut()},
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'HonestBorrow',
                                      style: TextStyle(
                                          color: _foregroundColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'Where Trust Meets Loans.',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 102, 102, 102),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.person_outline),
                                  iconSize: 30,
                                  color: Colors.grey[50],
                                  onPressed: () => {},
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: m_size.height * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${snapshot.data!.snapshot.child('fullname').value}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 102, 102, 102),
                                      fontSize: 26),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Loan Status: ',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 102, 102, 102),
                                        fontSize: 18
                                      ),
                                    ),
                                    snapshot.data!.snapshot.child('hasLoan').value as bool ? const Text(
                                      'Active',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18
                                      ),
                                    ) : const Text(
                                      'In Process',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                Container(
                                    height: 52,
                                    width: 131,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(26.00),
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            stops: [
                                              0.3,
                                              0.9
                                            ],
                                            colors: [
                                              Color.fromRGBO(148, 41, 254, 1),
                                              Color.fromRGBO(61, 91, 251, 1)
                                            ])),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                      onPressed: () => {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Profile'),
                                              content: Text('Profile Page Coming Soon...'),
                                            );
                                          },
                                        )
                                      },
                                      child: const Text(
                                        'Profile',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 60,
                                ),
                                Container(
                                    height: 52,
                                    width: 131,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(26.00),
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            stops: [
                                              0.3,
                                              0.9
                                            ],
                                            colors: [
                                              Color.fromRGBO(148, 41, 254, 1),
                                              Color.fromRGBO(61, 91, 251, 1)
                                            ])),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                      onPressed: () => {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            if(snapshot.data!.snapshot.child('hasLoan').value as bool){
                                              return const AlertDialog(
                                                title: Text('Loan'),
                                                content: Text('Pay your LOAN!'),
                                              );
                                            }else{
                                              return const AlertDialog(
                                                title: Text('Loan'),
                                                content: Text('Your loan request is currently under review. Kindly await approval from the administrator. We appreciate your patience and understanding during this process.'),
                                              );
                                            }
                                          },
                                        )
                                      },
                                      child: const Text(
                                        'Active Loan',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
