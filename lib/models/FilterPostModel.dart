class filterPostModel {
  int? status;
  String? message;
  int? total;
  List<Data>? data;

  filterPostModel({this.status, this.message, this.total, this.data});

  filterPostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? hostelname;
  String? mobile;
  String? whoAdd;
  int? totalroom;
  String? hostelfor;
  String? hosteltype;
  int? isowner;
  String? ownername;
  int? isSingleAvailable;
  int? singleBedPrice;
  int? isDoubleAvailable;
  int? doubleBedPrice;
  int? isTripleAvailable;
  int? tripleBedPrice;
  List<String>? facility;
  String? closeTime;
  String? openTime;
  String? rating;
  String? address;
  String? longitude;
  String? latitude;
  int? stateId;
  int? cityId;
  String? placeName;
  int? pincode;
  List<String>? image;
  String? logo;
  int? status;
  String? meshMenuPic;
  String? description;
  String? rules;
  String? createdAt;
  String? updatedAt;
  String? stateName;
  String? cityName;
  List<FacilitiesWithIcons>? facilitiesWithIcons;

  Data(
      {this.id,
      this.hostelname,
      this.mobile,
      this.whoAdd,
      this.totalroom,
      this.hostelfor,
      this.hosteltype,
      this.isowner,
      this.ownername,
      this.isSingleAvailable,
      this.singleBedPrice,
      this.isDoubleAvailable,
      this.doubleBedPrice,
      this.isTripleAvailable,
      this.tripleBedPrice,
      this.facility,
      this.closeTime,
      this.openTime,
      this.rating,
      this.address,
      this.longitude,
      this.latitude,
      this.stateId,
      this.cityId,
      this.placeName,
      this.pincode,
      this.image,
      this.logo,
      this.status,
      this.meshMenuPic,
      this.description,
      this.rules,
      this.createdAt,
      this.updatedAt,
      this.stateName,
      this.cityName,
      this.facilitiesWithIcons});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hostelname = json['hostelname'];
    mobile = json['mobile'];
    whoAdd = json['who_add'];
    totalroom = json['totalroom'];
    hostelfor = json['hostelfor'];
    hosteltype = json['hosteltype'];
    isowner = json['isowner'];
    ownername = json['ownername'];
    isSingleAvailable = json['is_single_available'];
    singleBedPrice = json['single_bed_price'];
    isDoubleAvailable = json['is_double_available'];
    doubleBedPrice = json['double_bed_price'];
    isTripleAvailable = json['is_triple_available'];
    tripleBedPrice = json['triple_bed_price'];
    facility = json['facility'].cast<String>();
    closeTime = json['close_time'];
    openTime = json['open_time'];
    rating = json['rating'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    placeName = json['place_name'];
    pincode = json['pincode'];
    image = json['image'].cast<String>();
    logo = json['logo'];
    status = json['status'];
    meshMenuPic = json['mesh_menu_pic'];
    description = json['description'];
    rules = json['rules'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    if (json['facilities_with_icons'] != null) {
      facilitiesWithIcons = <FacilitiesWithIcons>[];
      json['facilities_with_icons'].forEach((v) {
        facilitiesWithIcons!.add(new FacilitiesWithIcons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hostelname'] = this.hostelname;
    data['mobile'] = this.mobile;
    data['who_add'] = this.whoAdd;
    data['totalroom'] = this.totalroom;
    data['hostelfor'] = this.hostelfor;
    data['hosteltype'] = this.hosteltype;
    data['isowner'] = this.isowner;
    data['ownername'] = this.ownername;
    data['is_single_available'] = this.isSingleAvailable;
    data['single_bed_price'] = this.singleBedPrice;
    data['is_double_available'] = this.isDoubleAvailable;
    data['double_bed_price'] = this.doubleBedPrice;
    data['is_triple_available'] = this.isTripleAvailable;
    data['triple_bed_price'] = this.tripleBedPrice;
    data['facility'] = this.facility;
    data['close_time'] = this.closeTime;
    data['open_time'] = this.openTime;
    data['rating'] = this.rating;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['place_name'] = this.placeName;
    data['pincode'] = this.pincode;
    data['image'] = this.image;
    data['logo'] = this.logo;
    data['status'] = this.status;
    data['mesh_menu_pic'] = this.meshMenuPic;
    data['description'] = this.description;
    data['rules'] = this.rules;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    if (this.facilitiesWithIcons != null) {
      data['facilities_with_icons'] =
          this.facilitiesWithIcons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FacilitiesWithIcons {
  String? title;
  String? icon;

  FacilitiesWithIcons({this.title, this.icon});

  FacilitiesWithIcons.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    return data;
  }
}
