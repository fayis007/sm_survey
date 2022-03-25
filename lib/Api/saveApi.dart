import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

saveApi(
    {houseNo,
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
  Response response = await http.post(
      Uri.parse("https://smreader.net/app/SurveyAppCustomerSave.php"),
      body:({
        "House_no": houseNo,
        "IsjalanidhiCustomer": IsjalanidhiCustomer,
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
  if(response.statusCode == 200){
    return json.decode(response.body);
  }
  else
    print(response.statusCode.toString()+"failed");
}
