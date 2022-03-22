import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smsurvay/Api/consumerApi.dart';

import 'package:smsurvay/Ui/homePage/DetailsPage2.dart';
import 'package:http/http.dart' as http;

class ConsumerPage extends StatefulWidget {
  const ConsumerPage({Key? key}) : super(key: key);

  @override
  _ConsumerPageState createState() => _ConsumerPageState();
}

class _ConsumerPageState extends State<ConsumerPage> {

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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage2()));
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
