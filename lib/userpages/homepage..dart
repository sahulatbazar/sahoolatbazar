import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomepPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('products');

    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar(
            //   backgroundColor: Colors.transparent,
            //   elevation: 0,
            //   iconTheme: IconThemeData(color: Colors.black),

            // ),
            Container(
              width: double.infinity,
              color: Colors.pink,
              height: 200,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                      )),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'sasda',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children: snapshot.data.docs
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.blue.shade600,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('product name :'),
                                            Text(e['name']),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('product price :'),
                                            Text(e['price']),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('product quantity :'),
                                            Text(e['quanity']),
                                          ],
                                        ),
                                      ],
                                    )),
                              ))
                          .toList(),
                    );
                  }),
            ),
          ],
        ),
      ),
      //     body: FutureBuilder<DocumentSnapshot>(
      //   future: users.doc().get(),
      //   builder:
      //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      //     if (snapshot.hasError) {
      //       return Text("Something went wrong");
      //     }

      //     if (snapshot.hasData && !snapshot.data!.exists) {
      //       return Text("Document does not exist");
      //     }

      //     if (snapshot.connectionState == ConnectionState.done) {
      //       Map<String, dynamic> data =
      //           snapshot.data!.data() as Map<String, dynamic>;
      //       return Text("name: ${data['name']} ${data['quanity']}");
      //     }

      //     return Text("loading");
      //   },
      // )
    );
  }
}
