// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cookbook_mobile/pages/recipe_details.dart';
import 'package:flutter/material.dart';

import '../pages/home.dart';

class CustomCard extends StatelessWidget {
  final String profileImg;
  final String title;
  final String imgRoute;
  final String customWidth;
  final String profileName;
  final String navigatorName;

  const CustomCard(
      {Key? key,
      required this.title,
      required this.imgRoute,
      required this.customWidth,
      required this.profileImg,
      required this.profileName,
      required this.navigatorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        shadowColor: Colors.blueGrey,
        child: InkWell(
          splashColor: Colors.grey.withAlpha(90),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsPage(recipeID:navigatorName))); 
          },
          child: Container(
            height: 220,
            width: customWidth == 'full'
                ? MediaQuery.of(context).size.width - 48
                : (MediaQuery.of(context).size.width - 58) / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(profileImg),
                            radius: 20,
                          ),
                          SizedBox(width: 10),
                          Text(profileName,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              if (imgRoute != '')
                                Image(
                                  image: AssetImage(imgRoute),
                                  height: 120,
                                ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  child: IconButton(
                                    icon: Icon(Icons.favorite_border),
                                    color: Colors.grey,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(title,
                                style: TextStyle(
                                    fontSize: 25,
                                  
                                    color: Colors.black)),
                     ],
                   ),
                   
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
