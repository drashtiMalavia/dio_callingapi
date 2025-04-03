import 'dart:convert';
/// userId : 1
/// id : 1
/// title : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
/// body : "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"


postModelClassFromJson(String str) => PostModelClass.fromJson(json.decode(str));
String postModelClassToJson(PostModelClass data) => json.encode(data.toJson());
class PostModelClass {
  PostModelClass({
    num? userId,
    num? id,
    String? title,
    String? body,}){
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }

  PostModelClass.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }
  num? _userId;
  num? _id;
  String? _title;
  String? _body;

  num? get userId => _userId;
  num? get id => _id;
  String? get title => _title;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }

}