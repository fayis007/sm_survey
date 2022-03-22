import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smsurvay/loginPage/loginPage.dart';



class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(
      Duration(milliseconds: 1500),
    );
   Navigator.push(
       context, MaterialPageRoute(builder: (context) => loginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Container()),
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Center(
                        child: Image.asset(
                          "assets/icons/smartsurveyicon.png",

                        ))),
              ),
              Expanded(
                child: Container(
                    height: 250,
                    width: 250,
                    child: Image.asset(
                      "assets/icons/workmate.png",
                    )),
              ),
            ],
          ),
        ));

  }
}
