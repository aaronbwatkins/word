import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/quote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quote> quotes = [];

  Future getQuotes() async {
    var response = await http.get(
      Uri.https(
        'zenquotes.io',
        'api/quotes',
      ),
    );
    var jsonData = jsonDecode(response.body);

    for (var i in jsonData) {
      final quote = Quote(author: i['a'], quote: i['q']);
      quotes.add(quote);
    }
  }

  @override
  Widget build(BuildContext context) {
    getQuotes();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(
                Icons.logout,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/detail', arguments: {
                        'quoteText': quotes[index].quote,
                        'authorName': quotes[index].author
                      });
                    },
                    isThreeLine: true,
                    title: Text(
                      quotes[index].author,
                    ),
                    subtitle: Text(
                      quotes[index].quote,
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
