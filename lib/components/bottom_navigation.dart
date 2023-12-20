

import 'package:cookbook_mobile/pages/addRecipe.dart';
import 'package:cookbook_mobile/pages/profile.dart';
import 'package:flutter/material.dart';

import '../pages/home.dart';


class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  BottomAppBarWidgetState createState() => BottomAppBarWidgetState();
}

class BottomAppBarWidgetState extends State<BottomAppBarWidget> {

  String message = ''; // Variable to store received messages

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
                IconButton(
              icon: Icon(Icons.home),
              color: Colors.grey,
              iconSize: 40,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
           
           
           FloatingActionButton(
              onPressed: ()  {
          Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddRecipePage() ));
              },
           child: Icon(Icons.document_scanner),
           backgroundColor: Colors.green.shade500,
           tooltip: "Scan",
           ),

        
          
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.grey,
              iconSize: 40,
              onPressed: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
