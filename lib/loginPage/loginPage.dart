import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String dropdownvalue = 'panchayat_1';
  var listofpanjayath = [
    'panchayat_1',
    'panchayat_2',
    'panchayat_3',
    'panchayat_4',
    'panchayat_5',
    'panchayat_6'
  ];

  bool isChecked = false;
  final _consumernumbercontroller = TextEditingController();
  final _consumerpasswordcontroller = TextEditingController();
  final _promocode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/icons/Background.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Form(
              //key: formkey,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.only(top: 100),
                    child: Image.asset('assets/icons/smpay_logo.png'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      width: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/icons/smpay_titile.png",
                            alignment: Alignment.topLeft,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sign With Username or email and \npassword to use your account',
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black87,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Select Panchayath"),
                                        GestureDetector(
                                            child: Image.asset(
                                                "assets/icons/SelectComplaint.png"))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black87,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Select Block"),
                                        GestureDetector(
                                            child: Image.asset(
                                                "assets/icons/SelectComplaint.png"))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )),
                        ],
                      )),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 11.5,
                          color: Colors.grey,
                          offset: Offset(7, 7))
                    ], borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: FlatButton(
                        height: 60,
                        minWidth: 170,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.lightBlueAccent,
                        onPressed: () {},
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                             fontSize: 19.5
                            ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
