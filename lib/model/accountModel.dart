

import 'package:topcode_interview_test/model/solidClass.dart';

class Account implements JsonAbstract{
  String id;
  String name;
  double balance;

  Account({
    this.id,
    this.name,
    this.balance
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json["id"],
    name: json["name"],
    balance: json["balance"],
  );

  Map<String,dynamic> toJson() => <String,dynamic>{
    'id': this.id,
    'name': this.name,
    'balance': this.balance,
  };


}
