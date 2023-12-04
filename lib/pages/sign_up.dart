// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cookbook_mobile/pages/login.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => __SignUpPageState();
}

class __SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool containsNumber = false;
  bool passwdLength = false;
  bool isPasswordConfirmed = true;
  bool isPasswordVisible = false;
  String errorEmailMessage = '';
  String errorPasswordMessage = '';

void checkForNumber(String newPassword) {
  bool containsNumber = newPassword.contains(RegExp(r'\d'));

  setState(() {
    this.containsNumber = containsNumber;
  });
}
void checkForLength(String newPassword) {
  bool passwordLength = newPassword.length >= 6;
  setState(() {
    this.passwdLength = passwordLength;
  });
  
}
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 8, left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 45.0,
                    ),
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Please enter your account here',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: 'Email or phone number',
                          prefixIconColor: Colors.grey.shade700,
                          prefixIcon: Icon(Icons.person_rounded),
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                          )),
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    if (errorEmailMessage != '')
                      Text(
                        errorEmailMessage,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                    SizedBox(
                      height: 18.0,
                    ),
                    TextField(
  obscureText: !isPasswordVisible,
  controller: passwordController,
  onChanged: (String newValue) {
    checkForNumber(newValue);
    checkForLength(newValue);
  },
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    hintText: 'Password',
    prefixIconColor: Colors.grey.shade700,
    prefixIcon: Icon(Icons.lock),
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible
          ? Icons.visibility_off
          : Icons.remove_red_eye_outlined,
      ),
      onPressed: () {
        setState(() {
          isPasswordVisible = !isPasswordVisible;
        });
      },
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade700,
    ),
  ),
  style: TextStyle(
    color: Colors.grey.shade700,
  ),
),

                  ],
                ),
              ),
            ),
            if (errorPasswordMessage != '')
              Text(
                errorPasswordMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left:22, right: 20, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Your Password must contain:',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18,
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:22, right: 20, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: (passwdLength)?Colors.green:Colors.grey.shade700,),
                    SizedBox(width: 10,),
                    Text('Atleast 6 characters',
                    
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                    ),),
                  ],
                ),
              ),
            ),
              Padding(
              padding: const EdgeInsets.only(left:22, right: 20, top: 7),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: (containsNumber)?Colors.green:Colors.grey.shade700,),
                    SizedBox(width: 10,),
                    Text('Contains a number',
                    
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                    ),),
                  ],
                ),
              ),
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
                  padding: const EdgeInsets.only(left: 120, right: 120, top: 20, bottom: 20),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () async {
                  String mail = emailController.text;
                  String password = passwordController.text;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  print(
                      "//////////////////////////////////////////////////////////////////////////");
                  print('mail: $mail');
            
                },
              ),
            ),
          ])),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: SizedBox(
            height: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      height: 0.1,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                ),
                TextButton(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.green,
                      height: 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}