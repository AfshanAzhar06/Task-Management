import 'package:flutter/material.dart';
import 'package:taskey/Screens/account.dart';
import 'package:taskey/Screens/addtask.dart';
import 'package:taskey/Screens/chats.dart';
import 'package:taskey/Screens/projectscreen.dart';
import 'package:taskey/Screens/todaytaskscreen.dart';

// ignore: must_be_immutable
class TaskScreen extends StatelessWidget {
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTaskScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodayTaskScreen()),
            );
          },
        ),
        title: const Text('Friday, 6'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add logic
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Let\'s make a \nhabits together🙌',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.asset('lib/assets/images/image1.png',
                    width: 300, height: 300),
                SizedBox(width: 10),
                Image.asset('lib/assets/images/intro1.png',
                    width: 300, height: 300),
                SizedBox(width: 10),
                Image.asset('lib/assets/images/taski.png',
                    width: 200, height: 200),
              ],
            ),
          ),
          Text(
            '\t In Progress',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
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
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${index * 10}%',
                        style:
                            TextStyle(color: Color.fromARGB(255, 39, 48, 176)),
                      ),
                      SizedBox(width: 10),
                    ],
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
