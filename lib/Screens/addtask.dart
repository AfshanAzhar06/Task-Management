import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Task Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            _buildTaskContainer('Mobile Application Design'),
            SizedBox(height: 16),
            Text(
              'Team Members',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            _buildTeamMembers([
              {'name': 'John Doe', 'image': 'lib/assets/images/image1.png'},
              {'name': 'Jane Smith', 'image': 'lib/assets/images/image1.png'},
              {'name': 'John Doe', 'image': 'lib/assets/images/image1.png'},
              {'name': 'Jane Smith', 'image': 'lib/assets/images/image1.png'},
            ]),
            Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            _buildTaskContainer('November 01,2021'),
            Text(
              'Start time              End Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            _buildTaskContainer('9:30am          3:30pm'),
          ],
        ),
      ),
    );
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

  Widget _buildTeamMembers(List<Map<String, String>> members) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: members
          .map(
            (member) => Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(member['image']!),
                ),
                SizedBox(height: 8),
                Text(
                  member['name']!,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
