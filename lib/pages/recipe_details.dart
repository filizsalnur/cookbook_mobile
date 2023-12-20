import 'dart:convert';
import 'package:cookbook_mobile/pages/home.dart';
import 'package:cookbook_mobile/services/alert_services.dart';
import 'package:flutter/material.dart';
import '../services/endpoint_services.dart';
  List<String> mealTypes = [
    'Pasta',
    'Salad',
    'Dessert',
    'Soup',
    'Kebab - Skewer',
    'Pizza',
    'Seafood',
    'Vegetable Dishes',
    'Fast Food',
  ];
class RecipeDetailsPage extends StatefulWidget {
  final String recipeID;

  RecipeDetailsPage({required this.recipeID});

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  Map<String, dynamic>? recipe;

  @override
  void initState() {
    super.initState();
    getOneRecipe();
  }
  @override
  String findIndex(String target, List<String> list) {
  int index = list.indexOf(target);
  String returnable= 'assets/images/'+index.toString()+'.png';
  return returnable;
}

  void getOneRecipe() async {
    try {
      final response = await EndpointServices().getOneRecipe(widget.recipeID);
      print(response.body);
      setState(() {
        recipe = jsonDecode(response.body);
      });
      print(recipe.toString());
    } catch (e) {
      print("Error fetching recipe: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: recipe == null
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      recipe!['title'] ?? 'Loading...',
                      style: TextStyle(fontSize: 28),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Image(
                      image: AssetImage(findIndex(recipe!['mealType'], mealTypes)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      recipe!['description'] ?? 'Loading...',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            bool resultOfDelete =
                await EndpointServices().deleteRecipe(widget.recipeID);
            if (resultOfDelete) {
              await AlertUtils().successfulAlert("Deleted!", context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            } else {
              await AlertUtils().errorAlert("Unexpected Error", context);
            }
          },
          child: Icon(Icons.delete)),
    );
  }
}
