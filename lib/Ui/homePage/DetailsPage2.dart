import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage2 extends StatefulWidget {
  const DetailsPage2({Key? key}) : super(key: key);

  @override
  _DetailsPage2State createState() => _DetailsPage2State();
}

class _DetailsPage2State extends State<DetailsPage2> {
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
        child: Scaffold(
            body: Container(
      padding: EdgeInsets.only(top: 50, left: 50, bottom: 0),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.blueGrey)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Address",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 120,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.blueGrey)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Mobile No",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 200,
                height: 40,
                child: TextField(
                  controller: _mobilectrl,
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
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
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
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "WhatsApp No",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 200,
                height: 40,
                child: TextField(
                  controller: _whatsAppctrl,
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
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
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
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Ward No",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 100,
                height: 40,
                child: TextField(
                  controller: _wardController,
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
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
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
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Meter No",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 150,
                height: 40,
                child: TextField(
                  controller: _meterController,
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
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
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
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Meter Reading",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 150,
                height: 40,
                child: TextField(
                  controller: _meterReadingController,
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
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
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
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Last Reading Date",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.blueGrey)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Balance Amount",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 150,
                height: 40,
                child: TextField(
                  controller: _balanceAmountCntlr,
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
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
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
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Complaint",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Complaint"),
                    GestureDetector(
                        child: Image.asset("assets/icons/SelectComplaint.png"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Remark",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 250,
                height: 40,
                child: TextField(
                  controller: _remarkctrl,
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
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
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
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: FlatButton(
                        height: 45,
                        minWidth: 130,
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
              ),
              SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    )));
  }
}
