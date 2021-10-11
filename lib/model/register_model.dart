class StoreRegisterModel {
  bool status;
  String message;
  Data data;

  StoreRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}
class Data {
  String name;
  String email;
  String phone;
  int id;
  String image;
  String token;
  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }
}
