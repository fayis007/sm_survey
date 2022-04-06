import 'package:flutter/material.dart';
import 'package:smsurvay/Ui/homePage/ConsumerPage.dart';
import 'package:smsurvay/Ui/homePage/DetailsPage.dart';


import 'package:smsurvay/Ui/homePage/homePage.dart';
import 'package:smsurvay/Ui/splashScreen.dart';
import 'package:smsurvay/Ui/verified.dart';
import 'package:smsurvay/loginPage/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: const splash_screen(),

    );
  }
}
