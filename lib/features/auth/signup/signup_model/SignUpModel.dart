class SignUpModel {
  SignUpModel({
      int? resState, 
      bool? success, 
      String? message, 
      Data? data, 
      Meta? meta,}){
    _resState = resState;
    _success = success;
    _message = message;
    _data = data;
    _meta = meta;
}

  SignUpModel.fromJson(dynamic json) {
    _resState = json['resState'];
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  int? _resState;
  bool? _success;
  String? _message;
  Data? _data;
  Meta? _meta;

  int? get resState => _resState;
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resState'] = _resState;
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

class Meta {
  Meta({
      int? count,}){
    _count = count;
}

  Meta.fromJson(dynamic json) {
    _count = json['count'];
  }
  int? _count;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
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