// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiResponse {
  final int statusCode;
  final String body;

  ApiResponse(this.statusCode, this.body);
}

class EndpointServices {
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  String baseUrl = 'http://localhost:5003/';
  Future<void> setBaseUrl(String newBaseUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('baseUrl', newBaseUrl);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<ApiResponse> getUserList() async {

      print('======================Get User List=====================');
    
      final url = baseUrl + 'api/User';

      print('======================Get User List=====================');
      try {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode >= 399) {
          print('ERROR: ${response.body}');
          return ApiResponse(response.statusCode, response.body);
        } else {
          print('OK');
          return ApiResponse(response.statusCode, response.body);
        }
      } catch (e) {
        print("Error in db_services: $e");
        return ApiResponse(500, "Error: $e");
      }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
