

import 'dart:convert';

import 'package:apilogin/signup.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'note.dart';

class NewPage extends StatefulWidget {
  NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  String token = "";
  List<dynamic> users = [];


  @override
  void initState() {

    super.initState();
    getCred();
    fetchUsers();

  }

  Future<void> getCred() async {
    SharedPreferences pref1 = await SharedPreferences.getInstance();
    setState(() {
      token = pref1.getString("login")!;
    }
    );
  }
  //var uri = new Uri.http("example.org", "/path", { "q" : "{http}" });
  Future<void> fetchUsers() async {
    print("fetchUsers called");
    const url1 = "https://reqres.in/api/users?page=1";
    final uri1 = Uri.parse(url1);
    final response = await http.get(uri1);

    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['data'];
    });}

  @override
  Widget build(BuildContext context) {



    return Material(
      child: Column(
        children: [
          SizedBox(
            height: 60,

          ),
          Padding(
            padding: const EdgeInsets.only(left: 220.0),
            child: OutlinedButton.icon(onPressed: () async {
              SharedPreferences pref1= await SharedPreferences.getInstance();
              await pref1.remove('login');

              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (BuildContext context)
                  {
                    return SignupScreen();
                  }
                  ),
                      (route) => false);


            },
              icon: Icon(Icons.login),
              label: Text("Logout"),
            ),
          ),
      Expanded(

      child: ListView.builder(

      itemCount: users.length,
      itemBuilder: (context, index) {
      final user = users[index];
      final firstName = user['first_name'];
      final lastName = user['last_name'];
      final email = user['email'];
      final imageurl = user['avatar'];
      return ListTile(

      //leading: Text("${index+1}"),
      leading: ClipRRect(
      borderRadius: BorderRadius.circular(100),

      child: Image.network(imageurl)),
      //child: Text('${index+1}')),
      title: Text(firstName + " " + lastName),
      subtitle: Text(email)
      ,
      );


      }



      )
      )
      ]
      ),
    );
  }
}
//
// Padding(
// padding: const EdgeInsets.all(15.0),
// child: SafeArea(
// child: Center(
// child: Column(
// children: [
// Text("Welcome user"),
// SizedBox(
// height: 15,
// ),
// Text("Your token  : ${token}"),
// SizedBox(
// height:10
// ),
// OutlinedButton.icon(onPressed: () async {
// SharedPreferences pref1= await SharedPreferences.getInstance();
// await pref1.remove('login');
//
// Navigator.pushAndRemoveUntil(context,
// MaterialPageRoute(builder: (BuildContext context)
// {
// return SignupScreen();
// }
// ),
// (route) => false);
//
//
// },
// icon: Icon(Icons.login),
// label: Text("Logout"),
// ),

//
// ],
//
// ),
// ),
//
// ),
// ),
//
// );
// }
// }
//
//
