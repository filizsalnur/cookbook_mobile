// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cookbook_mobile/pages/myHome.dart';
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                       backgroundColor:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color:Colors.green,width: 3)
                    ),
                    fixedSize: Size.fromHeight(60),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.dark_mode,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isLightModeSelected,
                        activeColor: Colors.blue.shade100,
                        onChanged: (bool value) {
                    
                          setState(() {
                            isLightModeSelected = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color:Colors.green,width: 3)
                    ),
                    fixedSize: Size.fromHeight(60),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
