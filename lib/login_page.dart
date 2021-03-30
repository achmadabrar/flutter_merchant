import 'package:flutter/material.dart';
import 'package:flutter_app_merchant/home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var phoneController = TextEditingController();
  var passController = TextEditingController();
  var isButtonEnabled = false;
  final buttonController = TextEditingController();

  @override
  void initState() {
    super.initState();

    phoneController.addListener((){
      //here you have the changes of your textfield
      print("value: ${phoneController.text}");
      //use setState to rebuild the widget
      setState(() {
        if ((phoneController.text.trim() != "") &&
            (passController.text.trim()) != "") {
          isButtonEnabled = true;
        } else {
          isButtonEnabled = false;
        }
      });
    });

    passController.addListener(() {
      print("value: ${passController.text}");
      //use setState to rebuild the widget
      setState(() {
        if ((phoneController.text.trim() != "") &&
            (passController.text.trim()) != "") {
          isButtonEnabled = true;
        } else {
          isButtonEnabled = false;
        }
      });
    });

  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${phoneController.text}");
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo_3.png'),
      ),
    );
    final noHandphoneTitle = Text("No. Handphone");
    final noHandphone = TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '08123456789',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final passwordTitle = Text("Password");
    final password = TextFormField(
      controller: passController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'xxxxxx',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(100.0),
        shadowColor: Colors.lightGreen.shade100,
        elevation: 1.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: isButtonEnabled == true
              ? () => Navigator.of(context).pushNamed(HomePage.tag)
              : null,
          color: Colors.lightGreen,
          disabledTextColor: Colors.lightGreen,
          textColor: Colors.white,
          child: Text('MASUK'),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            noHandphoneTitle,
            noHandphone,
            SizedBox(height: 8.0),
            passwordTitle,
            password,
            SizedBox(height: 24.0),
            loginButton
          ],
        ),
      ),
    );
  }
}
