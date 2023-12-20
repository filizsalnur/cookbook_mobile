import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/endpoint_services.dart';

class RecipeDetailsPage extends StatefulWidget {
  final String recipeID;

  RecipeDetailsPage({required this.recipeID});

  @override
  RecipeDetailsPageState createState() => RecipeDetailsPageState();
}

class RecipeDetailsPageState extends State<RecipeDetailsPage> {
  Map<String, dynamic> recipe = {};

  @override
  void initState() {
    super.initState();
    _fetchRecipeDetails();
  }

  void _fetchRecipeDetails() {
    _getOneRecipe().then((response) {
      if (response.statusCode >= 399) {
        print('ERROR: ${response.body}');
        return;
      }
      print(response.body);

      setState(() {
        recipe = jsonDecode(response.body.toString());
      });
    });
  }

  Future<dynamic> _getOneRecipe() {
    return EndpointServices().getOneRecipe(widget.recipeID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                recipe['title'],
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 25,
              ),
              Image(
                image: AssetImage("assets/images/food_2.png"),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                recipe['description'],
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
