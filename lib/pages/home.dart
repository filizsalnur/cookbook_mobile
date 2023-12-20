import 'dart:convert';
import 'package:cookbook_mobile/services/alert_services.dart';
import 'package:cookbook_mobile/services/endpoint_services.dart';
import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';
import '../components/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> recipeList = [];
  late Future<void> _recipeListFuture;


  Future<void> _getRecipeList() async {
    final response = await EndpointServices().getRecipeList();
    setState(() {
      recipeList = jsonDecode(response.body);
    });
    print(recipeList.toString());
  }

  @override
  void initState() {
    super.initState();
    _recipeListFuture = _getRecipeList();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(backgroundColor: Colors.grey.shade100),
        ),
        body: FutureBuilder(
            future: _recipeListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (recipeList.isEmpty) {
                AlertUtils().InfoAlert("No Recipes", context);
              }

              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: recipeList.map((recipe) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomCard(
                              title: recipe['title'],
                              mealType: recipe['mealType'],
                              customWidth: 'full',
                              navigatorName: recipe['id'],
                              profileName: recipe['userName'],
                              profileImg: 'assets/images/profile_1.png',
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              );
            }),
        bottomNavigationBar: BottomAppBarWidget(),
      ),
    );
  }
}
