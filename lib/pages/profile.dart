// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


import '../components/bottom_navigation.dart';
import './login.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "";
  String userEmail = "";
  bool light = true;
  bool isLightModeSelected = true;
  @override
  void initState() {

      setState(() {
        isLightModeSelected = false;
      });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0), child: AppBar(backgroundColor: Colors.white,)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
       
  
          
              
             
                    SizedBox(height: 20),
                 Center(
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage('assets/images/profile_2.png'),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () async {
               
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    Text('Logout',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                        )),
                        
                  ],
                ),
              )
            ],
          ),
        ),
      ),
     bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
