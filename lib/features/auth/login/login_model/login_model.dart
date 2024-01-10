class LoginModel {
  LoginModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;

  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      String? accessToken, 
      String? refreshToken, 
      bool? isActivated,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _isActivated = isActivated;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
    _isActivated = json['isActivated'];
  }
  String? _accessToken;
  String? _refreshToken;
  bool? _isActivated;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  bool? get isActivated => _isActivated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    map['isActivated'] = _isActivated;
    return map;
  }

}