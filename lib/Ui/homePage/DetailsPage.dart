import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smsurvay/Api/consumerApi.dart';
import 'package:smsurvay/Api/saveApi.dart';
import 'package:smsurvay/Ui/verified.dart';
import 'package:http/http.dart' as http;
import 'homePage.dart';

class DetailsPage extends StatefulWidget {
  final isjalacustomer;
  final String? needconnection;
  final String? houseNo;
  final String? consuno;
  final consumerData? objcosudata;

  const DetailsPage(
      {Key? key,
      this.objcosudata,
      this.consuno,
      this.houseNo,
      this.needconnection,
      this.isjalacustomer})
      : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String dropdownvalue = "Select Complaint";
  var items = [
    'Select Complaint',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  initState() {
    String? y = widget.houseNo;
    String? x = widget.consuno;
  }

  DateTime date = DateTime(2000, 1, 10);
  final _wardController = TextEditingController();
  final _meterController = TextEditingController();
  final _meterReadingController = TextEditingController();
  final _balanceAmountCntlr = TextEditingController();
  final _remarkctrl = TextEditingController();
  final _mobilectrl = TextEditingController();
  final _whatsAppctrl = TextEditingController();
  final _namectrlr = TextEditingController();
  final _addressctrlr = TextEditingController();
  final _datecontrlr = TextEditingController();
  final formkey_save = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            Form(
              key: formkey_save,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Name",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    child: TextFormField(

                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                      cursorHeight: 30,
                      controller: _namectrlr,
                      decoration: InputDecoration(
                          hintText: widget.objcosudata!.name,
                          hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                    "Address",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 320,
                    height: 100,
                    child: TextFormField(

                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                      cursorHeight: 30,
                      controller: _addressctrlr,
                      decoration: InputDecoration(
                          hintText: widget.objcosudata!.address,
                          hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                  //SizedBox(
                  //  height: 20,
                  //  ),
                  Text(
                    "Mobile No",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    child: TextFormField(
                      validator: (value_save) {
                        if (value_save!.isEmpty) {
                          return "Please Enter Mobile No";
                        }
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                      cursorHeight: 30,
                      controller: _mobilectrl,
                      decoration: InputDecoration(
                          hintText: widget.objcosudata!.mobile,
                          hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    child: TextFormField(
                      validator: (value_save) {
                        if (value_save!.isEmpty) {
                          return "Please Enter WhatsApp No";
                        }
                      },
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    child: TextFormField(

                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                      cursorHeight: 30,
                      controller: _wardController,
                      decoration: InputDecoration(
                          hintText: widget.objcosudata!.location,
                          hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    child: TextFormField(
                      validator: (value_save) {
                        if (value_save!.isEmpty) {
                          return "Please Enter Meter No";
                        }
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                      cursorHeight: 30,
                      controller: _meterController,
                      decoration: InputDecoration(
                          hintText: widget.objcosudata!.meterNumber,
                          hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    child: TextFormField(
                      validator: (value_save) {
                        if (value_save!.isEmpty) {
                          return "Please Enter Meter Reading";
                        }
                      },
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  Container(
                    height: 50,
                    width: 320,
                    child: TextFormField(
                      validator: (value_save) {
                        if (value_save!.isEmpty) {
                          return "Please Enter Date";
                        }
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                      cursorHeight: 30,
                      controller: _datecontrlr,
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
                    "Balance Amount",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    child: TextFormField(
                      validator: (value_save) {
                        if (value_save!.isEmpty) {
                          return "Please Enter Balence Amount";
                        }
                      },
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            underline: SizedBox(),
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon:
                                Image.asset("assets/icons/SelectComplaint.png"),

                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),

                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                var complaint = dropdownvalue;
                              });
                            },
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Remark",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
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
                                borderRadius: new BorderRadius.circular(30.0)),

                            //color: Colors.lightBlueAccent,
                            onPressed: () {
                              saveApi(
                                branchcode: "12",
                                houseNo: widget.houseNo,
                                IsjalanidhiCustomer: widget.isjalacustomer,
                                consumer_no: widget.consuno,
                                name: _namectrlr.text,
                                address: _addressctrlr.text,
                                mobile: _mobilectrl.text,
                                Whatsapp: _whatsAppctrl.text,
                                Ward: _wardController.text,
                                meter_number: _meterController.text,
                                NeedConnection: widget.needconnection,
                                opening_reading: _meterReadingController.text,
                                lastreadingDate: _datecontrlr.text,
                                balance_amount: _balanceAmountCntlr.text,
                                Complaint: dropdownvalue,
                                Remarks: _remarkctrl.text,
                              );
                              if (formkey_save.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => verifiedPage()));
                              }
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
              ),
            )
          ],
        ),
      ),
    )));
  }
}
