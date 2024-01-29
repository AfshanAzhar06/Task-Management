import 'package:flutter/material.dart';
import 'package:taskey/Screens/chats.dart';
import 'package:taskey/Screens/projectscreen.dart';
import 'package:taskey/Screens/taskscreen.dart';

// ignore: must_be_immutable
class AccountScreen extends StatelessWidget {
  int _selectedIndex = 0;

  void _onItemTapped(int index, BuildContext context) {
    if (index == 2) {
      _showAddOptions(context);
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
    }
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountScreen()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProjectScreen()),
      );
    }
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskScreen()),
      );
    }
  }

  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAddOption(context, Icons.assignment, 'Create Task'),
              _buildAddOption(context, Icons.business, 'Create Project'),
              _buildAddOption(context, Icons.event, 'Create Event'),
              _buildAddOption(context, Icons.group, 'Create Team'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddOption(BuildContext context, IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        // Add logic for handling each option
        Navigator.pop(context); // Close the bottom sheet
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskScreen()),
            );
          },
        ),
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/assets/images/intro1.png'),
            ),
            SizedBox(height: 10),
            Text(
              ' Afshan Azhar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("afshanazhar06@gmail.com"),
            SizedBox(
              height: 20,
            ),
            Text(
              "  5            25",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text("ongoing        total complete"),
            _buildTaskContainer('Mobile   App   Design'),
            _buildTaskContainer('Mobile project Design'),
            _buildTaskContainer('Mobile project setting'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index, context),
        selectedItemColor: Color.fromARGB(255, 39, 48, 176),
        unselectedItemColor: Color.fromARGB(255, 39, 48, 176),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Folder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget _buildTaskContainer(String taskName) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 235, 231, 231),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      taskName,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
  );
}
