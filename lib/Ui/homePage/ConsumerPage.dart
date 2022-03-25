import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smsurvay/Api/consumerApi.dart';

import 'package:http/http.dart' as http;
import 'package:smsurvay/Ui/homePage/DetailsPage.dart';

class ConsumerPage extends StatefulWidget {
  final String? isjalacustomer;
  final String? needconnection;
  final String? houseno;
  const ConsumerPage(
      {Key? key, this.houseno, this.isjalacustomer, this.needconnection})
      : super(key: key);

  @override
  _ConsumerPageState createState() => _ConsumerPageState();
}

class _ConsumerPageState extends State<ConsumerPage> {
  void consumercall(String cosumerNo) {
    consumerdetailscall(cosumerNo);
  }

  void consumerdetailscall(String cosu) async {
    await ConsumerApiCalling(cosu);
  }

  String? _id;
  String? _name;
  String? _address;
  String? _mobile;
  String? _location;
  String? _category;
  String? _meterNumber;
  List<consumerData>? consumerDetails = [];

  String url = "https://smreader.net/app/SurveyAppCustomer.php";
  List<consumerData> Data1 = [];
  Future? objfutur;
  String? Status;
  Future<model_consumer> ConsumerApiCalling(
    String consumerno,
  ) async {
    model_consumer? objmodel_consumer;
    var response = await http.post(Uri.parse(url),
        body: {"consumer_no": consumerno, "branchcode": "12"});

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        objmodel_consumer = model_consumer.fromJson(data);
        print(response.body);
        if (objmodel_consumer.status == "true") {
          for (int i = 0; i < objmodel_consumer.consumerDetails!.length; i++) {
            consumerDetails!.add(objmodel_consumer.consumerDetails![i]);
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        consuno: _consumer.text,
                        objcosudata: consumerDetails![0],
                        houseNo: widget.houseno,
                        needconnection: widget.isjalacustomer,
                        isjalacustomer: widget.needconnection,
                      )));
        }
      } catch (e) {
        print(e);
      }
    }
    return objmodel_consumer!;
  }

  final _consumer = TextEditingController();
  final formkey1 = GlobalKey<FormState>();

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
            key: formkey1,
            child: Container(
              padding: EdgeInsets.all(50),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Consumer No",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        height: 60,
                        child: TextFormField(
                          validator: (value1) {
                            if (value1!.isEmpty) {
                              return "Please Enter Consumer No";
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 26),
                          cursorHeight: 30,
                          controller: _consumer,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                                borderRadius: new BorderRadius.circular(30.0)),
                            //color: Colors.lightBlueAccent,
                            onPressed: () {
                              if (formkey1.currentState!.validate()) {
                                consumercall(_consumer.text);
                              }
                            },
                            child: Text(
                              "Proceed",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.5,
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    )));
  }
}
