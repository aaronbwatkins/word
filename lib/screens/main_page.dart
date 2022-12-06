import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:word/screens/home_screen.dart';
import 'package:word/screens/settings_page.dart';
import 'auth_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'fav_page.dart';

int selectedIndex = 0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    List pages = [
      HomeScreen(),
      FavePage(),
      SettingsPage(),
    ];

    void onTap(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
        bottomNavigationBar: GNav(
          selectedIndex: selectedIndex,
          gap: 8,
          onTabChange: (index) {
            onTap(index);
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'HOME',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'FAVORITE',
            ),
            GButton(
              icon: Icons.verified_user,
              text: 'PROFILE',
            ),
          ],
        ),
        body: pages[selectedIndex]
        // StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: ((context, snapshot) {
        //     if (snapshot.hasData) {
        //       return pages[selectedIndex];
        //     } else {
        //       return AuthPage();
        //     }
        //   }),
        // ),
        );
  }
}
