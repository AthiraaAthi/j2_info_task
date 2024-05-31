import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:j2_infotech_task/model/my_model.dart';
import 'package:http/http.dart' as http;

class MyController with ChangeNotifier {
  //Map<String, dynamic> decodedData = {};
  SampleApi sampleApiobj = SampleApi();
  Future<List<SampleApi>> fetchData() async {
    notifyListeners();
    var url =
        Uri.parse("https://mysaving.in/WonderMaths/api/myaddresssample.php");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List decodedData2 = json.decode(response.body);
    return decodedData2.map((e) => SampleApi.fromJson(e)).toList();
  }
}
