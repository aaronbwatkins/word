import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:word/components/quote.dart';
import 'package:word/screens/auth_page.dart';
import '../components/constants.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  getIcon() {
    if (isFavorite) {
      return Icon(Icons.favorite, size: 50);
    } else {
      return Icon(Icons.favorite_border_outlined, size: 50);
    }
  }

  Future addToFavorites(String quoteText, String author) async {
    String userID = auth.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('users/$userID/favorites')
        .add({'userID': userID, 'quoteText': quoteText, 'author': author});
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final authorName = routeArgs['authorName'];
    final quoteText = routeArgs['quoteText'];

    sharePressed() {
      String message = '${quoteText.toString()} -${authorName.toString()}';
      Share.share(message);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DETAIL',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quoteText.toString(),
              style: kDetailQuoteTextStyle,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '- ${authorName.toString()}',
              style: kDetailAuthorNameTextStyle,
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    addToFavorites(quoteText.toString(), authorName.toString());
                  },
                  child: getIcon(),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: sharePressed,
                  child: Icon(
                    Icons.share,
                    size: 50,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
