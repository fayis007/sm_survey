import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smsurvay/Api/consumerApi.dart';
import 'package:smsurvay/Ui/verified.dart';
import 'package:http/http.dart' as http;
import 'homePage.dart';

class DetailsPage2 extends StatefulWidget {
  const DetailsPage2({Key? key}) : super(key: key);

  @override
  _DetailsPage2State createState() => _DetailsPage2State();
}

class _DetailsPage2State extends State<DetailsPage2> {
  String url = "https://smreader.net/app/SurveyAppCustomer.php";
  List<consumerData> Consumerdata = [];
  String? id;
  String? name2;
  String? Status;

  Future? objfuture;
  Future<model_consumer> consumerApiCalling() async {
    model_consumer? objmodel_consumer;
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        objmodel_consumer = model_consumer.fromJson(data);
        print(response.body);
        Status = objmodel_consumer.status;
        setState(() {
          for (int i = 0; i < objmodel_consumer!.data!.length; i++) {
            Consumerdata.add(objmodel_consumer.data![i]);
          }
        });
      } catch (e) {
        print(e);
      }
    }
    return objmodel_consumer!;
  }

  @override
  void initState() {
    objfuture = consumerApiCalling();
    super.initState();
  }
  //$$$$$$$$$$$$$$$$$   SAVE API $$$$$$$$$$$$$$$$$$$$






  DateTime date = DateTime(2000, 1, 10);
  final _wardController = TextEditingController();
  final _meterController = TextEditingController();
  final _meterReadingController = TextEditingController();
  final _balanceAmountCntlr = TextEditingController();
  final _remarkctrl = TextEditingController();
  final _mobilectrl = TextEditingController();
  final _whatsAppctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
      future: objfuture,
      builder: (context, snap) {
        if (snap.hasData) {
          return Scaffold(
              body: Container(
            padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
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
              // color: Colors.yellow,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //margin: EdgeInsets.only(left: 50,right: 50),
              padding: EdgeInsets.only(left: 0, right: 0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.blueGrey)),
                        child: Text(Consumerdata[0].name!),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.blueGrey)),
                        child: Text(Consumerdata[0].address!),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Mobile No",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 26),
                          cursorHeight: 30,
                          controller: _mobilectrl,
                          decoration: InputDecoration(
                            suffixText: Consumerdata[0].mobile!,
                              enabledBorder: OutlineInputBorder(

                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "WhatsApp No",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 26),
                          cursorHeight: 30,
                          controller: _whatsAppctrl,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ward No",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 26),
                          cursorHeight: 30,
                          controller: _wardController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Meter No",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 26),
                          cursorHeight: 30,
                          controller: _meterController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Meter Reading",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        child: TextField(
                          style: TextStyle(fontSize: 26),
                          cursorHeight: 30,
                          textAlign: TextAlign.center,
                          controller: _meterReadingController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Last Reading Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: Colors.blueGrey)),
                        child: FlatButton(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            if (newDate == null) return;
                            setState(() => date = newDate);
                          },
                          child: Text(
                            '${date.year} - ${date.month} - ${date.day}',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 19.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Balance Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 26),
                          cursorHeight: 30,
                          controller: _balanceAmountCntlr,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Complaint",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blueGrey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Complaint",
                              style: TextStyle(fontSize: 16.5),
                            ),
                            GestureDetector(
                                child: Image.asset(
                                    "assets/icons/SelectComplaint.png")),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Remark",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 26),
                          cursorHeight: 30,
                          controller: _remarkctrl,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
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
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                //color: Colors.lightBlueAccent,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              verifiedPage()));
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.5),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
        } else {
          return Text("ERROR");
        }
      },
    ));
  }
}
