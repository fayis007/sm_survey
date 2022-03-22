import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smsurvay/loginPage/loginPage.dart';
import 'package:lottie/lottie.dart';

class verifiedPage extends StatefulWidget {
  const verifiedPage({Key? key}) : super(key: key);

  @override
  _verifiedPageState createState() => _verifiedPageState();
}

class _verifiedPageState extends State<verifiedPage> {
  @override
  void initState() {
    _navigator2();
    super.initState();
  }

  _navigator2() async {
    await Future.delayed(
      Duration(milliseconds: 1600),
    );
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>loginPage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
       children: [
         Container( 
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.height,
           color: Colors.white,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Lottie.network("https://assets6.lottiefiles.com/packages/lf20_ztkr1lgk.json",width: 150,height: 150),
               SizedBox(height: 20,),
               Text("Success!",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,fontSize: 50.5),)
             ],
           ),
         ),
       ],
      ),
    ));
  }
}
