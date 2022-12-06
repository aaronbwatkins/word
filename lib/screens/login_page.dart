import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/text_input.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({required this.showRegisterPage});

  final VoidCallback showRegisterPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } catch (e) {
      return AlertDialog(
        title: Text('Invalid username or password. Please try again.'),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  'It\'s so good to see you.',
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
                  controller: _passwordController,
                  textInputHint: 'Password',
                  obscureText: true,
                ),

                // sign in button
                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPasswordPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'FORGOT PASSWORD?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
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
                      'Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        ' Register now',
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
