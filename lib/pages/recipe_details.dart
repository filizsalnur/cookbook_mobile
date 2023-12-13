import 'dart:convert';
import 'package:flutter/material.dart';
import '../services/endpoint_services.dart';

class RecipeDetailsPage extends StatefulWidget {
  final String recipeID;

  RecipeDetailsPage({required this.recipeID});

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  Map<String, dynamic> recipe = {};

  @override
  void initState() {
    super.initState();
    _getOneRecipe();
  }

  void _getOneRecipe() async {
    final response = await EndpointServices().getOneRecipe(widget.recipeID);
    print(response.body);

    setState(() {
      recipe = jsonDecode(response.body.toString());
    });
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
