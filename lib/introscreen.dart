import 'package:flutter/material.dart';
import 'package:taskey/registration/signin.dart';

class MySliderScreen extends StatefulWidget {
  @override
  _MySliderScreenState createState() => _MySliderScreenState();
}

class _MySliderScreenState extends State<MySliderScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildSliderPage(
                  "Task Management",
                  Colors.white,
                  "lib/assets/images/intro1.png",
                  " Lets create a\n space for your \n workflows"),
              _buildSliderPage(
                  "Task Management",
                  Colors.white,
                  "lib/assets/images/taski.png",
                  " Work more\n structured and\n organized"),
              _buildSliderPage(
                  "Task Management",
                  Colors.white,
                  "lib/assets/images/image1.png",
                  " Manage your\n tasks quickly for\n results"),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text("Skip"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderPage(
      String text, Color color, String imagePath, String description) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 400,
            height: 400,
          ),
          SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
              color: Color.fromARGB(255, 2, 55, 99),
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
