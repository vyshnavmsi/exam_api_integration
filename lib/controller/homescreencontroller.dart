import 'dart:developer';

import 'package:exam_api_integration/model/objectmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreencontroller with ChangeNotifier {
  List<Objectsmodel> product = [];

  bool isLoading = false;
  Future<void> getData() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.parse('https://api.restful-api.dev/objects');
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        product = objectsFromJson(response.body);
      }
    } catch (e) {
      log('$e');
    }
    isLoading = false;
    notifyListeners();
  }
}
