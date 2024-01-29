import 'package:flutter/material.dart';
import 'package:taskey/registration/signin.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Please enter your information\nand and create account",
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
                  hintText: 'Enter your Name',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),
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
              child: const TextField(
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
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 33, 37, 243),
                  onPrimary: Colors.white,
                  elevation: 10,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Sign Up'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text("Signup with"),
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
                  const SizedBox(height: 10),
                  const Text(
                    'Have an account?',
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
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
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
