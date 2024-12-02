import 'package:flutter/material.dart';
import 'package:healthcare1/models/user.dart';
import 'package:healthcare1/pages/DoctorDashboard.dart';
import 'package:healthcare1/services/userService.dart';

class EditUser extends StatefulWidget {
  final User user;
  const EditUser({Key? key,required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
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

  @override
  void initState() {
    setState(() {
      _namecontroller.text=widget.user.name??'';
      _dobcontroller.text=widget.user.dob??'';
      _gendercontroller.text=widget.user.gender??'';
      _phonecontroller.text=widget.user.phone??'';
      _emailcontroller.text=widget.user.email??'';
      _addresscontroller.text=widget.user.address??'';
      _symptomscontroller.text=widget.user.symptoms??'';
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 69,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 96, 179, 205),
        title: const Text(
          "Patients Edit Details",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox(
                height: 10.0,
              ),
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
              const SizedBox(
                height: 30.0,
              ),
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
                          var result=await _userService.UpdateUser(_user);
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>const  DoctorDashboard(),));
                        }
                      },
                      child: const Text('Update Details')),
                  const SizedBox(
                    width: 20.0,
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
    );
  }
}