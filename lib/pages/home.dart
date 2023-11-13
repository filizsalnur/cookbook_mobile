// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

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
  @override
  void initState() {
    super.initState();
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
     
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchBarApp(),
                  
                  SizedBox(height: 20),
                 
         
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      children: [
                        CustomCard(
                            
                            title: "Salad",
                            imgRoute: "assets/images/food_1.png",
                            customWidth: 'half',navigatorName: "",
                            profileName: "John Doe",
                            profileImg: 'assets/images/profile_1.png',),
                        CustomCard(
                        
                            title: "Pancake",
                            imgRoute: "assets/images/food_2.png",
                            customWidth: 'half',navigatorName: "",
                             profileName: "Calum Lewis",
                            profileImg: 'assets/images/profile_2.png',),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.7,
                      enlargeCenterPage: false,
                  
                    ),
                    items: [
                      CustomCard(
                          
                          title: "Salad",
                          imgRoute: "assets/images/food_1.png",
                          customWidth: 'half',navigatorName: "",
                          profileName: "John Doe",
                          profileImg: 'assets/images/profile_1.png',),
                      CustomCard(
                      
                          title: "Pancake",
                          imgRoute: "assets/images/food_2.png",
                          customWidth: 'half',navigatorName: "",
                           profileName: "Calum Lewis",
                          profileImg: 'assets/images/profile_2.png',),
                    ],
                  ),
                ],
              ),
           
          ),
        ),
        bottomNavigationBar: BottomAppBarWidget(),
      ),
    );
  }
}
