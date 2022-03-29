import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'modelSaveClass.dart';

saveApi(
    {branchcode,
    houseNo,
    IsjalanidhiCustomer,
    NeedConnection,
    consumer_no,
    name,
    address,
    mobile,
    Whatsapp,
    Ward,
    meter_number,
    opening_reading,
    lastreadingDate,
    balance_amount,
    Complaint,
    Remarks}) async {
  var response = await http.post(
      Uri.parse("https://smreader.net/app/SurveyAppCustomerSave.php"),
      body: ({
        "branchcode": "12",
        "House_no": houseNo,
        "IsjalanidhiCustomer":"1",
        "NeedConnection": NeedConnection,
        "consumer_no": consumer_no,
        "name": name,
        "address": address,
        "mobile": mobile,
        "Whatsapp": Whatsapp,
        "Ward": Ward,
        "meter_number": meter_number,
        "opening_reading": opening_reading,
        "lastreadingDate": lastreadingDate,
        "balance_amount": balance_amount,
        "Complaint": Complaint,
        "Remarks": Remarks,
      }));
  if (response.statusCode == 200) {
    //  return json.decode(response.body);
    var k = json.decode(response.body);
    model_save? objmodel_save = model_save.fromJson(k);
    var status = objmodel_save.status;
    if (status == "True") {
      print("data saved");
    } else {
      print("data not saved");
    }
  }
}
