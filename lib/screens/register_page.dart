import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/text_input.dart';
import '../components/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.showLoginPage});
  final VoidCallback showLoginPage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signUp() async {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          )
          .then((value) => {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(value.user!.uid)
              });

      addUserDetails(
        _usernameController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  Future addUserDetails(String username, String email) async {
    await FirebaseFirestore.instance.collection('users').add(
        {'username': username, 'email': email, 'uid': auth.currentUser!.uid});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // hello again
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.chat,
                  size: 100,
                ),
                Text(
                  'Hello There!',
                  style: kGreetingText,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Register below with your email.',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),

                // email textfield
                TextInputBox(
                  controller: _emailController,
                  textInputHint: 'Email',
                  obscureText: false,
                ),
                SizedBox(
                  height: 10.0,
                ),

                TextInputBox(
                  controller: _usernameController,
                  textInputHint: 'Username',
                  obscureText: false,
                ),
                SizedBox(
                  height: 10.0,
                ),

                TextInputBox(
                  controller: _passwordController,
                  textInputHint: 'Password',
                  obscureText: true,
                ),

                // sign in button
                SizedBox(
                  height: 10,
                ),

                TextInputBox(
                  controller: _confirmPasswordController,
                  textInputHint: 'Confirm Password',
                  obscureText: true,
                ),

                // sign in button
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        ' Sign In',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )

                // sign up
              ],
            ),
          ),
        ),
      ),
    );
  }
}
