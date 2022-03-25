class model_consumer {
  String? _status;
  List<consumerData>? consumerDetails;

  model_consumer({String? status, List<consumerData>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (data != null) {
      this.consumerDetails = data;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  List<consumerData>? get data => consumerDetails;
  set data(List<consumerData>? data) => consumerDetails = data;

  model_consumer.fromJson(Map<String, dynamic> json) {
    _status = json['Status'];
    if (json['data'] != null) {
      consumerDetails = <consumerData>[];
      json['data'].forEach((v) {
        consumerDetails!.add(new consumerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this._status;
    if (this.consumerDetails != null) {
      data['data'] = this.consumerDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class consumerData {
  String? _id;
  String? _name;
  String? _address;
  String? _mobile;
  String? _location;
  String? _category;
  String? _meterNumber;

  consumerData(
      {String? id,
        String? name,
        String? address,
        String? mobile,
        String? location,
        String? category,
        String? meterNumber}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (address != null) {
      this._address = address;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (location != null) {
      this._location = location;
    }
    if (category != null) {
      this._category = category;
    }
    if (meterNumber != null) {
      this._meterNumber = meterNumber;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get meterNumber => _meterNumber;
  set meterNumber(String? meterNumber) => _meterNumber = meterNumber;

  consumerData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _mobile = json['mobile'];
    _location = json['Location'];
    _category = json['category'];
    _meterNumber = json['meter_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['address'] = this._address;
    data['mobile'] = this._mobile;
    data['Location'] = this._location;
    data['category'] = this._category;
    data['meter_number'] = this._meterNumber;
    return data;
  }
}
