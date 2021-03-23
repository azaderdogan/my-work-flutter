import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_work/models/base_model.dart';

class User extends BaseModel {
  int id;
  String username;
  String password;
  String name;
  String lastName;
  int owe;
  static const String tableName = '_user';

  User({this.username, this.password, this.name, this.lastName, this.owe = 0});

  User.withId(
      {this.id,
      this.username,
      this.password,
      this.name,
      this.lastName,
      this.owe = 0});

  //User.fromMap(dynamic obj) { // bu şkilde de verilebilir.
  // for getDatabase
  User.fromMap(Map<String, dynamic> user) {
    this.id = user["id"];
    this.name = user["name"];
    this.lastName = user["lastName"];
    this.username = user["username"];
    this.password = user["password"];
    this.owe = user['owe'];
  }

  @override
  String toString() => 'User($id,$name)';

  @override
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["username"] = this.username;
    map["password"] = this.password;
    map["name"] = this.name;
    map["lastName"] = this.lastName;
    map['owe'] = this.owe;
    if (this.id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}

