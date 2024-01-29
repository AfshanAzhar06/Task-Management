import 'package:flutter/material.dart';
import 'package:taskey/introscreen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 103, 176),
      body: Column(
        children: <Widget>[
          // Image on the upper half of the screen with fixed size
          Container(
            height: 400, // Set the desired height
            width: 400,
            child: Image.asset(
              'lib/assets/images/for1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Rest of the content on the lower half of the screen
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white, // Background color of the container
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Taskey",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 33, 37, 243),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          "Building better \n WorkPlaces",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: Text(
                          "create a unique emotional story that \ndescribes better than words",
                          style: TextStyle(
                            color: Color.fromARGB(120, 134, 134, 134),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MySliderScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 33, 37, 243),
                          onPrimary: Colors.white,
                          elevation: 10,
                          padding: EdgeInsets.all(20),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
