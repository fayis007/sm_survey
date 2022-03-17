import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "വീട്ട് നമ്പർ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  width: 150,
                  height: 40,
                  child: TextField(
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
                  height: 25,
                ),
                Text(
                  "നിലവിൽ ജലനിധി കണക്ഷൻ ഉണ്ടോ ?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                              color: Colors.blueGrey,
                              onPressed: () {},
                              child: Text("Yes")),
                          FlatButton(
                              color: Colors.grey,
                              onPressed: () {},
                              child: Text("No")),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "പുതിയ കണക്ഷൻ ആവശ്യം ഉണ്ടോ ?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                          color: Colors.blueGrey,
                          onPressed: () {},
                          child: Text("Yes")),
                      FlatButton(
                          color: Colors.grey,
                          onPressed: () {},
                          child: Text("No")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
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
                          height: 40,
                          minWidth: 100,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          //color: Colors.lightBlueAccent,
                          onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}
