import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smsurvay/Ui/homePage/ConsumerPage.dart';

import 'package:smsurvay/Ui/homePage/DetailsPage2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smsurvay/Ui/verified.dart';
import 'package:smsurvay/loginPage/loginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
  }

  final formkey = GlobalKey<FormState>();
  final _housecontroller = TextEditingController();
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
      child: Container(
        // margin: EdgeInsets.only(left: 70, right: 10),
        //padding: EdgeInsets.only(left: 0, top: 100),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: EdgeInsets.only(top: 200),
          children: [
            Form(
              key: formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "വീട്ട് നമ്പർ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.5),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: 180,
                    height: 60,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter House No";
                        }
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                      cursorHeight: 30,
                      controller: _housecontroller,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      FlatButton(
                          onPressed: () {
                            _getFromCamera();
                          },
                          child: Image.asset(
                            "assets/icons/Camera_icon.png",
                            height: 70,
                            width: 70,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "നിലവിൽ ജലനിധി കണക്ഷൻ\n ഉണ്ടോ ?",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19.5),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                                color: Color(0xff056782),
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ConsumerPage()));
                                  }
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      fontSize: 19.5, color: Colors.white),
                                )),
                            FlatButton(
                                color: Color(0xff32b4cf),
                                onPressed: () async {
                                  if(formkey.currentState!.validate()){
                                    bool result = await showDialog(
                                        context: context,
                                        builder: (context) {

                                          return AlertDialog(
                                            title: Text(""),
                                            content: Text(
                                              "പുതിയ കണക്ഷൻ ആവശ്യം ഉണ്ടോ ?",
                                              style: TextStyle(
                                                  fontSize: 19.5,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            actions: [
                                              FlatButton(
                                                  color: Color(0xff056782),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                verifiedPage()));
                                                  },
                                                  child: Text(
                                                    "yes",
                                                    style: TextStyle(
                                                        fontSize: 19.5,
                                                        color: Colors.white),
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              FlatButton(
                                                  color: Color(0xff32b4cf),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                verifiedPage()));
                                                  },
                                                  child: Text(
                                                    "No",
                                                    style: TextStyle(
                                                        fontSize: 19.5,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          );
                                        });

                                  }

                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      fontSize: 19.5, color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }

  void popup(BuildContext) {
    ScaffoldMessenger.of(BuildContext).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      content: Text("hello"),
    ));
  }
}
