import 'package:flutter/material.dart';
import 'package:taskey/Screens/account.dart';
import 'package:taskey/Screens/calender.dart';
import 'package:taskey/Screens/chats.dart';
import 'package:taskey/Screens/projectscreen.dart';
import 'package:taskey/Screens/taskscreen.dart';

// ignore: must_be_immutable
class TodayTaskScreen extends StatelessWidget {
  final List<String> taskNames = [
    'Create detail booking',
    'Revision home page',
    'Working on landing page',
    'working on notebook',
    'complete my notebook',
  ];

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
        title: const Text('Today Task'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Add logic
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'October 20',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarScreen()),
              );
            },
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(7, (index) {
                DateTime date = DateTime.now().add(Duration(days: index));
                String formattedDate = '${date.day}/${date.month}';
                return Container(
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 227, 227),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      formattedDate,
                      style: TextStyle(
                        color: Color.fromARGB(255, 59, 54, 54),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskNames.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    taskNames[index],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ],
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
