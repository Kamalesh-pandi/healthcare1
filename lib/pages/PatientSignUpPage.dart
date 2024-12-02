// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthcare1/pages/PatientLoginPage.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PatientSignUpPage extends StatefulWidget {
  const PatientSignUpPage({super.key});

  @override
  State<PatientSignUpPage> createState() => _PatientSignUpPageState();
}

class _PatientSignUpPageState extends State<PatientSignUpPage> {
  @override
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final url =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCYvLqaoighuPjIOyz9y1376MebFqINq4Q";
  Future<void> _signUp() async {
    final email = _emailcontroller.text;
    final pass = _passwordcontroller.text;
    final res = await http.post(Uri.parse(url),
        body: json.encode(
            {'email': email,
             'password': pass,
             'returnSecureToken': true,
             },
             ),
             );
             final result=json.decode(res.body);
             print(res.statusCode);
             if(res.statusCode==200){
              Get.to(PatientLoginPage());
              Get.snackbar("Success", "Sign Up successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
             }
             print(result.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              // App Logo
              Container(
                height: 150,
                child: Image.asset("asserts/patient-icon-8.png"),
              ),
              const SizedBox(height: 30),
              // Welcome Text
              const Text(
                'Patient Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Email Field
              TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password Field
              TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // Forgot Password

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue),
                  onPressed: _signUp,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Register Link
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientLoginPage(),
                      ));
                  // Add navigation to the signup page
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
