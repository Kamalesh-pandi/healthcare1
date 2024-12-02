import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:healthcare1/pages/DoctorDashboard.dart';


class DoctorLoginPage extends StatefulWidget {
  const DoctorLoginPage({super.key});

  @override
  State<DoctorLoginPage> createState() => _DocotorLoginPageState();
}
const users =  {
  'kamaleshpandi07@gmail.com': 'Kamaleshpandi@2007',
};
class _DocotorLoginPageState extends State<DoctorLoginPage> {
   Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }
  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return 'Recovery Password';
    });
  }
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Doctor',
      theme: LoginTheme(
        primaryColor: Colors.lightBlueAccent
      ),
      logo: const AssetImage('asserts/1731771399877.png'),
      onLogin: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const DoctorDashboard(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}