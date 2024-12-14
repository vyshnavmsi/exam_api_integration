import 'dart:developer';

import 'package:exam_api_integration/model/objectmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsController with ChangeNotifier {
  Objectsmodel? product;

  bool isLoading = false;
  Future<void> getData({required String count}) async {
    isLoading = true;
    notifyListeners();
    var url = Uri.parse('https://api.restful-api.dev/objects/$count');
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        product = objectsdetailmodelFromJson(response.body);
      }
    } catch (e) {
      log('$e');
    }
    isLoading = false;
    notifyListeners();
  }
}
