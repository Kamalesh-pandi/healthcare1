import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:healthcare1/models/user.dart';
import 'package:healthcare1/services/userService.dart';


class PatientInputForm extends StatefulWidget {
  @override
  _PatientInputFormState createState() => _PatientInputFormState();
}

class _PatientInputFormState extends State<PatientInputForm> {
  final TextEditingController _namecontroller=TextEditingController();
  final TextEditingController _dobcontroller=TextEditingController();
  final TextEditingController _gendercontroller=TextEditingController();
  final TextEditingController _phonecontroller=TextEditingController();
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _addresscontroller=TextEditingController();
  final TextEditingController _symptomscontroller=TextEditingController();
   
   bool _validateName=false;
   bool _validateDoB=false;
   bool _validateGender=false;
   bool _validatePhone=false;
   bool _validateemail=false;
   bool _validateaddress=false;
   bool _validateSymptoms=false;

  var _userService=UserService(); 

  final _formKey = GlobalKey<FormState>();
 

  String? fullName, dateOfBirth, gender, phone, email, address, symptoms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.lightBlueAccent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:const Text('Patient Form',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Full Name
                TextFormField(
                  controller: _namecontroller,
                  decoration: InputDecoration(labelText: 'Full Name',
                  errorText:
                        _validateName ? 'Full Name is required' : null,
                  ),
                ),
                // Date of Birth
                TextFormField(
                  controller: _dobcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Age',
                  errorText:
                        _validateName ? 'Age is required' : null,
                  ),                      
                ),
                // Gender
                TextFormField(
                  controller: _gendercontroller,
                  decoration: InputDecoration(labelText: 'Gender',
                  errorText:
                        _validateName ? 'Gender is required' : null,
                  ),
                ),
                // Contact Information
                TextFormField(
                  controller: _phonecontroller,
                  decoration: InputDecoration(labelText: 'Phone',
                  errorText:
                        _validateName ? 'Phone Number is required' : null,),
                  keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(labelText: 'Email',
                  errorText:
                        _validateName ? 'Email is required' : null,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                // Address
                TextFormField(
                  controller: _addresscontroller,
                  decoration: InputDecoration(labelText: 'Address',
                  errorText:
                        _validateName ? 'Address is required' : null,
                  ),
                ),
                // Symptoms
                TextFormField(
                  controller: _symptomscontroller,
                  decoration: InputDecoration(labelText: 'Symptoms',
                  errorText:
                        _validateName ? 'Symptoms is required' : null,
                  ),
                  maxLines: 3,
                ),
                // Medical History
                
                // Document Upload
                const SizedBox(height: 30),
                 Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _namecontroller.text.isEmpty
                              ?  _validateName= true
                              : _validateName = false;
                          _dobcontroller.text.isEmpty
                              ? _validateDoB = true
                              : _validateDoB = false;
                          _gendercontroller.text.isEmpty
                              ? _validateGender = true
                              : _validateGender= false;
                          _phonecontroller.text.isEmpty
                              ? _validatePhone = true
                              : _validatePhone = false;
                           _emailcontroller.text.isEmpty
                              ? _validateemail = true
                              : _validateemail = false;
                          _addresscontroller.text.isEmpty
                              ? _validateaddress = true
                              : _validateaddress = false;
                          _symptomscontroller.text.isEmpty
                              ? _validateSymptoms = true
                              : _validateSymptoms = false;
                        });
                        if (_validateName == false &&
                            _validateDoB == false &&
                            _validateGender == false &&
                            _validatePhone == false &&
                            _validateemail == false &&
                            _validateaddress == false &&
                            _validateSymptoms == false) {
                         // print("Good Data Can Save");
                          var _user = User();
                          _user.name = _namecontroller.text;
                          _user.dob = _dobcontroller.text;
                          _user.gender = _gendercontroller.text;
                          _user.phone = _phonecontroller.text;
                          _user.email = _emailcontroller.text;
                          _user.address = _addresscontroller.text;
                          _user.symptoms=_symptomscontroller.text;
                          var result=await _userService.SaveUser(_user);
                          print(result);
                          Get.snackbar("Successfully", "Form Filled Successfully",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white);
                         
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 25.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _namecontroller.text = '';
                        _dobcontroller.text = '';
                        _gendercontroller.text = '';
                        _phonecontroller.text = '';
                        _emailcontroller.text = '';
                        _addresscontroller.text = '';
                        _symptomscontroller.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
