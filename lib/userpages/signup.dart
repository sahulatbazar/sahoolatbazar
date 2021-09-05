import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sahoolar_bazar/userpages/homepage..dart';

class SignupPage extends StatelessWidget {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController fname = TextEditingController();

  TextEditingController lname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Colors.blue,
        //   Colors.green,
        // ])),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
              child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset('aseets/logo.jpg'),
                  )),
              Expanded(
                child: TextFormField(
                  controller: fname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter first name',
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: lname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter last name',
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: emailC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter email',
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: passwordC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter password',
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              MaterialButton(
                color: Colors.blue.shade400,
                onPressed: () {
                  if (!emailC.text.contains('@') || passwordC.text.length < 7) {
                    Fluttertoast.showToast(msg: 'ivalid data');
                    print(emailC.text);
                    print(passwordC.text);
                  } else {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.createUserWithEmailAndPassword(
                        email: emailC.text, password: passwordC.text);

                    User user = auth.currentUser;
                    if (user != null) {
                      // FirebaseFirestore firestore = FirebaseFirestore.instance;
                      CollectionReference users =
                          FirebaseFirestore.instance.collection('users');
                      users
                          .add({
                            'fname': fname.text,
                            'lname': lname.text,
                            'email': emailC.text,
                            'password': passwordC.text,
                          })
                          .then((value) => print("User Added"))
                          .catchError(
                              (error) => print("Failed to add user: $error"));

                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomepPage()));
                    }
                  }
                },
                child: Text('SIGNUP'),
              )
            ],
          )),
        ),
      ),
    );
  }
}
