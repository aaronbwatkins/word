import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

final user = FirebaseAuth.instance.currentUser!;
final userID = user.uid;

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    List<Object> favesList = [];
    Future getFaveCount() async {
      final favorites = await FirebaseFirestore.instance
          .collection('users/$userID/favorites')
          .get()
          .then((value) => {
                value.docs.forEach((element) {
                  favesList.add(element);
                })
              });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('SETTINGS'),
      ),
      body: FutureBuilder(
        future: getFaveCount(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi there, ${user.email!}',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'You have ${favesList.length.toString()} favorite quotes',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
