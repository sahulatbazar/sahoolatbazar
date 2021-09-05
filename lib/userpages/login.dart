import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahoolar_bazar/adminside/adminlogin.dart';
import 'package:sahoolar_bazar/adminside/adminmainpage.dart';
import 'package:sahoolar_bazar/userpages/homepage..dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Colors.white,
        //   Colors.blue,
        // ])),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
              child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Image.asset('aseets/logo.jpg'),
                  )),
              Expanded(
                child: TextFormField(
                  controller: emailC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: passwordC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              MaterialButton(
                color: Colors.blue.shade400,
                onPressed: () {
                  if (!emailC.text.contains('@') || passwordC.text.length < 7) {
                  } else {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signInWithEmailAndPassword(
                        email: emailC.text, password: passwordC.text);
                    User user = auth.currentUser;
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomepPage()));
                    }
                  }
                },
                child: Text('LOGIN'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AdminLogin()));
                  },
                  child: Text(
                    'I AM ADMIN',
                    style: TextStyle(color: Colors.black87),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
