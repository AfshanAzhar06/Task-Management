import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> chatNames = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Williams',
    // Add more chat names as needed
  ];

  List<String> filteredChats = [];

  @override
  void initState() {
    super.initState();
    filteredChats.addAll(chatNames);
  }

  void _filterChats(String query) {
    setState(() {
      filteredChats = chatNames
          .where((chat) => chat.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ChatSearchDelegate(chatNames),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredChats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(filteredChats[index]),
            subtitle: Text('Last message...'),
            onTap: () {},
          );
        },
      ),
    );
  }
}

class ChatSearchDelegate extends SearchDelegate<String> {
  final List<String> chatNames;

  ChatSearchDelegate(this.chatNames);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(query);
  }

  Widget _buildSearchResults(String query) {
    final List<String> filteredChats = chatNames
        .where((chat) => chat.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredChats.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredChats[index]),
          onTap: () {
            close(context, filteredChats[index]);
          },
        );
      },
    );
  }
}
