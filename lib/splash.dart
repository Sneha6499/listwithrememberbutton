import 'dart:async';
import 'package:apilogin/newpage.dart';
import 'package:apilogin/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _Splash();
}


class _Splash extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
            ()=> checkLogin()
    );
  }
  void checkLogin()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    if( val!=null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return NewPage(
            );
          },
        ),
            (raute) => false,
      );
    }
    else{
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const SignupScreen(


            );
          },
        ),
            (raute) => false,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("splash"),

      //  child: Image.asset("assetts/exodus.gif" ,height: 1000,width: 700,)
    );
  }
}