

class UserModel {
  String? firstName;
  String? phone;
  String? password;


  UserModel({this.firstName,this.phone,this.password,});

  UserModel.fromJson(Map<String,dynamic> json) {
    firstName = json['firstName'];
    phone = json['phone'];
    password = json['password'];

  }

  Map<String, dynamic> toJson()=>{
    'firstName':firstName,
    'phone':phone,

  };

}