// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiResponse {
  final int statusCode;
  final String body;

  ApiResponse(this.statusCode, this.body);
}
class Credentials {
  String email;
  String userId;


  Credentials(this.email, this.userId);
}

class EndpointServices {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  String baseUrl = 'http://192.168.1.116:5003/';
  Future<void> setBaseUrl(String newBaseUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('baseUrl', newBaseUrl);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<ApiResponse> getUserList() async {



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
  Future<ApiResponse> createUser(String email, String password) async {


    final url = baseUrl + 'api/User';

    print('======================Create User=====================');
    try {
      final Map<String, dynamic> requestData = {
        '"UserName"': '"$email"',
        '"Email"': '"$email"',
        '"Password"': '"$password"',
        '"Recipes"': []
      };
      print(requestData);
      final response =
          await http.post(Uri.parse(url),  headers: <String, String>{
        'Content-Type': 'application/json',
      }, body: jsonEncode(requestData));

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
    Future<ApiResponse> getRecipeList() async {


    final url = baseUrl + 'api/Recipe';

    print('======================Get Recipe List=====================');
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
    Future<ApiResponse> getOneRecipe(String recipeID) async {


    final url = baseUrl + 'api/Recipe/$recipeID';

    print('======================Get Recipe =====================');
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
  Future<int> createRecipe(String title, String description) async {
    String userName = await getMail();
    String userId = await getUserId();

    final url = baseUrl + 'api/Recipe';

    print('======================Create User=====================');
    try {
      final Map<String, dynamic> requestData = {
        'Title': '$title',
        'Description': '$description',
        'UserName': '$userName',
        'UserId': '$userId'
      };
      print(jsonEncode(requestData));
      final response =
          await http.post(Uri.parse(url),  headers: <String, String>{
        'Content-Type': 'application/json',
      }, body: jsonEncode(requestData));

      if (response.statusCode >= 399) {
        print('ERROR: ${response.body}');
        return response.statusCode;
      } else {
        print('OK');
        return response.statusCode;
      }
    } catch (e) {
      print("Error in db_services: $e");
      return 500;
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     Future<void> saveCredentials(
      String mail, String userId) async {
    final prefs = await SharedPreferences.getInstance();
      prefs.setString('email', mail);
      prefs.setString('userId', userId);

  }
    Future<Credentials> loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();

    String mailController = prefs.getString('email') ?? '';
    String userIdController = prefs.getString('userId') ?? '';

    return Credentials(mailController, userIdController);
  }
    Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String user = prefs.getString('userId') ?? 'userId';
    return user;
  }
      Future<String> getMail() async {
    final prefs = await SharedPreferences.getInstance();
    String mail = prefs.getString('email') ?? 'email';
    return mail;
  }

}
