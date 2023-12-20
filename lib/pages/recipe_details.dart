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
  List<dynamic>? recipes; // Use nullable list

  @override
  void initState() {
    super.initState();
    getOneRecipe();
  }

  void getOneRecipe() async {
    try {
      final response = await EndpointServices().getRecipeList();
      setState(() {
        recipes = jsonDecode(response.body);
      });
      print(recipes.toString());
    } catch (e) {
      print("Error fetching recipes: $e");
      // Handle the error, e.g., show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: recipes == null
              ? CircularProgressIndicator()  
              : Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      recipes![0]['title'] ?? 'Loading...',
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
                      recipes![0]['description'] ?? 'Loading...',  
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
