// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'dart:convert';

import 'package:cookbook_mobile/services/endpoint_services.dart';
import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';

import '../components/custom_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../components/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> recipeList = [];


  @override
  void initState() {
    super.initState();
    _getRecipeList();
  }
  void _getRecipeList() async {
    final response = await EndpointServices().getRecipeList();
    setState(() {
      recipeList = jsonDecode(response.body);
    });
    print(recipeList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: AppBar(backgroundColor: Colors.grey.shade100)),
        body: SingleChildScrollView(
          child: SafeArea(
     
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
  children: recipeList.map((recipe) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCard(
            title: recipe['title'],
            imgRoute: "assets/images/food_1.png", // Özel resminizi ekleyin
            customWidth: 'full', // Özel genişliği belirtin
            navigatorName: recipe['id'],
            profileName: recipe['userName'],
            profileImg: 'assets/images/profile_1.png', // Özel resminizi ekleyin
          ),
        ),
      ],
    );
  }).toList(),
),
           
          ),
        ),
        bottomNavigationBar: BottomAppBarWidget(),
      ),
    );
  }
}
