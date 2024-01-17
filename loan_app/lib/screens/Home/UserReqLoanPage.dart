import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loan_app/Models/UserObj.dart';
import 'package:loan_app/Shared/Background.dart';
import 'package:loan_app/Shared/constants.dart';
import 'package:loan_app/services/realtimeDatabase.dart';

class UserReqLoan extends StatefulWidget {
  final UserObj user;
  const UserReqLoan({super.key, required this.user});

  @override
  State<UserReqLoan> createState() => _UserReqLoanState();
}

class _UserReqLoanState extends State<UserReqLoan> {
  final _formKey = GlobalKey<FormState>();

  final _foregroundColor = Color.fromARGB(255, 90, 79, 239);

  //Credits Variables
  List CreditList = [
    ['Rs. 5,000', 5000],
    ['Rs. 10,000', 10000],
    ['Rs. 15,000', 15000],
    ['Rs. 20,000', 20000],
    ['Rs. 25,000', 25000],
  ];
  int _currentIndex = 0;

  List<int> NoOfMonthsList = [2, 4, 6, 8, 10, 12];
  int NoOfMonthsCurrentValue = 2;

  final List _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    var m_size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Background(
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: m_size.height * 0.7,
              //color: Colors.amber,
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
                          onPressed: () => {
                            FirebaseAuth.instance.signOut()
                          },
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
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.person_outline),
                          iconSize: 30,
                          color: _foregroundColor,
                          onPressed: () => {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: m_size.height * 0.45,
                    //color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                          width: m_size.width * 0.65,
                          //color: Colors.indigoAccent,
                          child: const Text(
                            'How much credit do you want?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 102, 102, 102),
                                fontSize: 26),
                          ),
                        ),
                        Container(
                          width: m_size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 70.0,
                                  onPageChanged: (index, reason) {
                                    _currentIndex = index;
                                    setState(() {});
                                  },
                                ),
                                items: CreditList.map((i) {
                                  return Container(
                                    //color: Colors.lime,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      i[0].toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 56.0,
                                        color: _foregroundColor,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                  child: const Text(
                                    'Swip right ot left to change',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 185, 185, 185)),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                          //color: Colors.pink,
                          width: m_size.width,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 52,
                            width: 131,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(26),
                                    bottomLeft: Radius.circular(26),
                                    bottomRight: Radius.circular(26)),
                                gradient: LinearGradient(
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
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      title: Text(
                                        'Enter Details!',
                                        style: TextStyle(
                                            color: _foregroundColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              readOnly: true,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 102, 102, 102)),
                                              decoration:
                                                  inputTextDecoration.copyWith(
                                                hintText:
                                                    CreditList[_currentIndex][0]
                                                        .toString(),
                                              ),
                                            ),
                                            DropdownButtonFormField<int>(
                                              value: NoOfMonthsCurrentValue,
                                              icon: const Icon(
                                                  Icons.arrow_downward),
                                              elevation: 16,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 102, 102, 102)),
                                              decoration:
                                                  inputTextDecoration.copyWith(
                                                      label: Text(
                                                          'No. of months')),
                                              onChanged: (int? value) {
                                                // This is called when the user selects an item.

                                                setState(() {
                                                  NoOfMonthsCurrentValue =
                                                      value!;
                                                });
                                              },
                                              items: NoOfMonthsList.map<
                                                      DropdownMenuItem<int>>(
                                                  (int value) {
                                                return DropdownMenuItem<int>(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                );
                                              }).toList(),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                                height: 52,
                                                width: 131,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                26)),
                                                    gradient:
                                                        LinearGradient(
                                                            begin: Alignment
                                                                .centerRight,
                                                            end: Alignment
                                                                .centerLeft,
                                                            stops: [
                                                          0.3,
                                                          0.9
                                                        ],
                                                            colors: [
                                                          Color.fromRGBO(
                                                              148, 41, 254, 1),
                                                          Color.fromRGBO(
                                                              61, 91, 251, 1)
                                                        ])),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent,
                                                  ),
                                                  onPressed: () => {
                                                    Navigator.pop(context),
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        final userDoc =
                                                            FirebaseDatabase
                                                                .instance
                                                                .ref('UserInfo')
                                                                .child(widget
                                                                    .user.uid
                                                                    .toString());
                                                        var currentDate =
                                                            DateTime(
                                                                DateTime.now()
                                                                    .year,
                                                                DateTime.now()
                                                                    .month,
                                                                DateTime.now()
                                                                    .day);
                                                        var dueDate = DateTime(
                                                            currentDate.year,
                                                            currentDate.month +
                                                                NoOfMonthsCurrentValue,
                                                            currentDate.day);
                                                        double
                                                            roughPaymentAmount =
                                                            CreditList[_currentIndex]
                                                                    [1] /
                                                                NoOfMonthsCurrentValue;

                                                        return StreamBuilder(
                                                            stream:
                                                                userDoc.onValue,
                                                            builder: (context,
                                                                AsyncSnapshot<
                                                                        DatabaseEvent>
                                                                    snapshot) {
                                                              return AlertDialog(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                ),
                                                                title: Text(
                                                                  'Request Loan',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          32,
                                                                      color:
                                                                          _foregroundColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                content: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    const SizedBox(
                                                                      height:
                                                                          40,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        const Text(
                                                                          'Est. Due Date: ',
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(255, 102, 102, 102),
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                        Text(
                                                                          '${dueDate.day}-${dueDate.month}-${dueDate.year}',
                                                                          style: const TextStyle(
                                                                              color: Color.fromARGB(255, 102, 102, 102),
                                                                              fontWeight: FontWeight.w800,
                                                                              fontSize: 18),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          30,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        const Text(
                                                                          'Est. Amount Per Month: ',
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(255, 102, 102, 102),
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                        Text(
                                                                          'Rs. ${roughPaymentAmount.ceil()}',
                                                                          style: const TextStyle(
                                                                              color: Color.fromARGB(255, 102, 102, 102),
                                                                              fontWeight: FontWeight.w800,
                                                                              fontSize: 16),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          40,
                                                                    ),
                                                                    const Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Text("\u2022"),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Flexible(
                                                                                child: Text(
                                                                              'Both parties acknowledge that estimated values are subject to change by the administrator, with clear communication of any adjustments.',
                                                                              style: TextStyle(color: Color.fromARGB(255, 102, 102, 102), fontSize: 13),
                                                                            ))
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text("\u2022"),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Flexible(
                                                                                child: Text(
                                                                              'There is a mutual commitment to transparency, ensuring parties are informed of changes to estimated values by the administrator.',
                                                                              style: TextStyle(color: Color.fromARGB(255, 102, 102, 102), fontSize: 13),
                                                                            ))
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text("\u2022"),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Flexible(
                                                                                child: Text(
                                                                              'HonestBorrow affirms a non-interest and non-charges policy, emphasizing a financial arrangement free from additional fees.',
                                                                              style: TextStyle(color: Color.fromARGB(255, 102, 102, 102), fontSize: 13),
                                                                            ))
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          40,
                                                                    ),
                                                                    Container(
                                                                        height:
                                                                            52,
                                                                        width:
                                                                            131,
                                                                        decoration: const BoxDecoration(
                                                                            borderRadius: BorderRadius.all(Radius.circular(
                                                                                26)),
                                                                            gradient:
                                                                                LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, stops: [
                                                                              0.3,
                                                                              0.9
                                                                            ], colors: [
                                                                              Color.fromRGBO(148, 41, 254, 1),
                                                                              Color.fromRGBO(61, 91, 251, 1)
                                                                            ])),
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            shadowColor:
                                                                                Colors.transparent,
                                                                          ),
                                                                          onPressed:
                                                                              () => {
                                                                                Navigator.pop(context),
                                                                            RealtimeDatabase().reqLoan(
                                                                                widget.user.uid.toString(),
                                                                                snapshot.data!.snapshot.child('fullname').value.toString(),
                                                                                CreditList[_currentIndex][1],
                                                                                NoOfMonthsCurrentValue,
                                                                                roughPaymentAmount,
                                                                                '${currentDate.day}-${currentDate.month}-${currentDate.year}',
                                                                                '${dueDate.day}-${dueDate.month}-${dueDate.year}')
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Request',
                                                                            style:
                                                                                TextStyle(fontSize: 18),
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              );
                                                            });
                                                      },
                                                    ),
                                                  },
                                                  child: const Text(
                                                    'Submit',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const Text(
                                              'Please ensure thorough review of the information you provide prior to submission. Once a loan request has been initiated, the details associated with it are immutable.',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 185, 185, 185),
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              },
                              child: const Text(
                                'Get',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
