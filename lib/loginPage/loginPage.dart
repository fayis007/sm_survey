import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smsurvay/Api/BGApi.dart';

import 'package:smsurvay/Api/panchayath.dart';
import 'package:smsurvay/Ui/homePage/homePage.dart';
import 'package:http/http.dart' as http;

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool isChecked = false;
  final _consumernumbercontroller = TextEditingController();
  final _consumerpasswordcontroller = TextEditingController();
  final _promocode = TextEditingController();
  var panchayath;
  String? id;
  String? name;
  String? Status;
  String url = "https://smreader.net/app/SurveyAppBranches.php";
  List<Data2> Userdata = [];
  Future? objfuture;
  Future<model_panchayath> PanchayathApiCalling() async {
    model_panchayath? objmodel_panchayath;
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        objmodel_panchayath = model_panchayath.fromJson(data);
        print(response.body);
        Status = objmodel_panchayath.status;
        setState(() {
          for (int i = 0; i < objmodel_panchayath!.data!.length; i++) {
            Userdata.add(objmodel_panchayath.data![i]);
          }
          name = Userdata[0].name;
          id = Userdata[0].id;
        });
      } catch (e) {
        print(e);
      }
    }
    return objmodel_panchayath!;
  }

  @override
  void initState() {
    objfuture = PanchayathApiCalling();
    super.initState();
  }

  //***********BG _API_POST ***************

  String? bgNo;
  List<Data>? BGdata = [];

  Future<model_BG> BgAPICalling(String id) async {
    model_BG? objmodel_BG;
    var response = await http
        .post(Uri.parse("https://smreader.net/app/SurveyAppWard.php"), body: {
      "branchcode": id,
    });
    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        objmodel_BG = model_BG.fromJson(data);
        print(response.body);
        Status = objmodel_BG.status;
        setState(() {
          BGdata!.clear();
          if (objmodel_BG!.status == "true") {
            for (int i = 0; i < objmodel_BG.data!.length; i++) {
              BGdata!.add(objmodel_BG.data![i]);
            }
          } else {
            print("not available!");
          }
        });
      } catch (e) {
        print(e);
      }
    }
    return objmodel_BG!;
  }

  final formkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
        future: objfuture,
        builder: (context, snap) {
          if (snap.hasData) {
            return Container(
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
                    key: formkey2,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 5,
                                          ),
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                              Expanded(
                                                child: DropdownButtonFormField<
                                                    dynamic>(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Panchayath";
                                                    }
                                                  },
                                                  hint: Text(
                                                    "Select Panchayath",
                                                    style: TextStyle(
                                                        fontSize: 17.5,
                                                        color: Colors.black),
                                                  ),
                                                  icon: (Image.asset(
                                                    "assets/icons/SelectComplaint.png",
                                                    fit: BoxFit.cover,
                                                    height: 30,
                                                    width: 30,
                                                  )),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      var k = value;
                                                    });
                                                  },
                                                  items: Userdata.map((e) {
                                                    return DropdownMenuItem(
                                                        value: e.name,
                                                        child: Container(
                                                          child: Row(
                                                            children: [
                                                              Text(e.name!),
                                                            ],
                                                          ),
                                                        ));
                                                  }).toList(),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const SizedBox(
                                          height: 75,
                                        ),
                                      ],
                                    )),
                              ],
                            )),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: <Color>[
                                Color(0xff32b4cf),
                                Color(0xff056782)
                              ]),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 11.5,
                                    color: Colors.grey,
                                    offset: Offset(7, 7))
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          child: FlatButton(
                              height: 60,
                              minWidth: 170,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              //color: Colors.lightBlueAccent,
                              onPressed: () {
                                //BgAPICalling("1");
                                if (Userdata[0].name!.isNotEmpty) {
                                  if (formkey2.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                } else {
                                  print("Empty!");
                                }
                                if (formkey2.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                }
                              },
                              child: Text(
                                "Proceed",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.5),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
