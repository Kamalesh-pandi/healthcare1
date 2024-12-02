import 'package:flutter/material.dart';
import 'package:healthcare1/pages/DoctorLoginPage.dart';
import 'package:healthcare1/pages/PatientLoginPage.dart';



class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
                "asserts/clean-medical-background_53876-101048.avif"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const DoctorLoginPage()),
                  );
                },
                child: Container(
                  height: 190,
                  width: 190,
                  child: Column(
                    children: [
                      Image.asset(
                        "asserts/1731771399877.png",
                        height: 150,
                      ),
                      const Text(
                        "DOCTOR",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientLoginPage(),
                      ));
                },
                child: Container(
                  height: 190,
                  width: 190,
                  child: Column(
                    children: [
                      Image.asset(
                        "asserts/patient-icon-8.png",
                        height: 150,
                      ),
                      const Text(
                        "PATIENT",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
