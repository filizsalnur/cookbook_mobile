// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'login.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: AssetImage('assets/images/rounded_1.png'),
                  ),
                  Image(
                    image: AssetImage('assets/images/rounded_3.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    width: 100,
                    image: AssetImage('assets/images/rounded_4.png'),
                  ),
                  Image(
                    image: AssetImage('assets/images/rounded_2.png'),
                  ),
                  Image(
                    width: 120,
                    image: AssetImage('assets/images/rounded_6.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage('assets/images/rounded_4.png'),
                  ),
                  Image(
                    image: AssetImage('assets/images/rounded_5.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, top: 20, bottom: 20),
                    child: const Text(
                      'Start Cooking',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                    print(
                        "##########################################################################");
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text('Let’s join our community \n to cook better food!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade600)),
            ],
          ),
        ));
  }
}
