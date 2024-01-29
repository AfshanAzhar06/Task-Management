import 'package:flutter/material.dart';
import 'package:taskey/Screens/taskscreen.dart';
import 'package:taskey/registration/signup.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please enter your email address\nand password for login",
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border:
                    Border.all(color: const Color.fromARGB(255, 12, 90, 153)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  hintText: 'Enter your Email',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color.fromARGB(255, 12, 90, 153),
                ),
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // forgot paswword
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 33, 37, 243),
                  onPrimary: Colors.white,
                  elevation: 10,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Sign In'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("Signin with"),
            ),
            SizedBox(height: 16),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/apple_logo.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        'lib/assets/images/google_logo.png',
                        height: 50,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Not registered yet?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue // Customize the color as needed
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
