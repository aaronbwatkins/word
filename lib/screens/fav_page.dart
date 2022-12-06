import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/quote.dart';

class FavePage extends StatefulWidget {
  const FavePage({super.key});

  @override
  State<FavePage> createState() => _FavePageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _FavePageState extends State<FavePage> {
  @override
  Widget build(BuildContext context) {
    List<Object> favesList = [];

    Future getFavorites() async {
      final userID = FirebaseAuth.instance.currentUser?.uid;
      await FirebaseFirestore.instance
          .collection('users/$userID/favorites')
          .get()
          .then(
            (value) => value.docs.forEach(
              (element) {
                favesList.add(element);
                //print(element['quoteText']);
              },
            ),
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('FAVORITES'),
      ),
      body: FutureBuilder(
        future: getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: favesList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: null,
                    isThreeLine: true,
                    title: Text(Quote.fromSnapshot(favesList[index]).author),
                    subtitle: Text(
                      Quote.fromSnapshot(favesList[index]).quote,
                    ),
                    leading: SizedBox(
                      height: 75.0,
                      width: 75.0, // fixed width and height
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://i.etsystatic.com/24170185/r/il/1b8ab2/3147701313/il_fullxfull.3147701313_nn7c.jpg',
                        ),
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
