import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
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
        title: Text('Projects'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle add button pressed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOption('Favourites'),
                _buildOption('Recent'),
                _buildOption('All'),
              ],
            ),
            SizedBox(height: 25),
            Expanded(
              child: ListView(
                children: [
                  _buildTaskContainer('Unity Dashboards😊'),
                  _buildTaskContainer('Instagram shots🤗'),
                  _buildTaskContainer('cubles✍️'),
                  _buildTaskContainer('Ui8 platforms🤠'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildTaskContainer(String taskName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 226, 231, 235),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        taskName,
        style: TextStyle(
          color: const Color.fromARGB(255, 27, 14, 14),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}
