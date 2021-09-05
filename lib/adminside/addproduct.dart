import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sahoolar_bazar/adminside/addproduct.dart';
import 'package:sahoolar_bazar/userpages/login.dart';

class AddProduct extends StatelessWidget {
  TextEditingController pname = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("SIGNIN AS ADMIN"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    child: Column(
                  children: [
                    Expanded(flex: 2, child: Image.asset('aseets/logo.jpg')),
                    Expanded(
                      child: TextFormField(
                        controller: pname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'enter product name',
                            prefixIcon: Icon(Icons.email)),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: quantity,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'enter quantity',
                            prefixIcon: Icon(Icons.lock)),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: price,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'enter price',
                            prefixIcon: Icon(Icons.lock)),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.red,
                      onPressed: () {
                        if (pname.text.isEmpty &&
                            quantity.text.isEmpty &&
                            price.text.isEmpty) {
                          Fluttertoast.showToast(msg: 'could not be empty');
                        } else {
                          // FirebaseFirestore firestore = FirebaseFirestore.instance;
                          CollectionReference users =
                              FirebaseFirestore.instance.collection('products');
                          users
                              .add({
                                'name': pname.text,
                                'quanity': quantity.text,
                                'price': price.text,
                              })
                              .then(
                                (value) => Fluttertoast.showToast(
                                    msg: 'product addes'),
                              )
                              .catchError(
                                (error) => Fluttertoast.showToast(
                                    msg: error.toString()),
                              );
                        }
                      },
                      child: Text('ADD DATA'),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
