import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:topcode_interview_test/config/config.dart';

class Services {

  Future<http.Response> getAccountList() async {
    Map<String, String> headers = {
      "key": Config.userId,
      "value": "application/JSON",
    };
    var response = await http.get(Config.url + Config.userId, headers: headers);
    if (response.statusCode == 200) {
      // checking response on console for testing purposes
      print(response.body);
      // returning the decoded response from the server
      return jsonDecode(response.body);
    } else {
      print('something went wrong!');
    }
  }

  Future<http.Response> getAccountById(String id) async {
    Map<String, String> headers = {
      "key": Config.userId,
      "value": "application/JSON",
    };;
    var response;
    response = http.get(Config.url + id + Config.userId, headers: headers);
    if (response.statusCode == 200) {
      // checking response on console for testing purposes
      print(response.body);
      // returning the decoded response from the server
      return jsonDecode(response.body);
    } else {
      print('something went wrong!');
    }
  }


  // optional requirement - add new account
  Future<http.Response> addNewAccount(JsonAbstract) async {
    Map<String, String> headers = {
      "key": Config.userId,
      "value": "application/JSON",
    };
    var response;
    response = await http.put(Config.url, headers: headers,
        body: jsonEncode(JsonAbstract.toJson()));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("something went wrong!");
    }
  }
}