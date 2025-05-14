import 'package:flutter/material.dart';

class SubscribedChannelPage extends StatelessWidget {
  final List<Map<String, String>> subscribers = [
    {
      'name': 'Floyd Miles',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
    },
    {
      'name': 'Wade Warren',
      'avatar': 'https://randomuser.me/api/portraits/men/2.jpg',
    },
    {
      'name': 'Dianne Russell',
      'avatar': 'https://randomuser.me/api/portraits/women/3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribed Channel'),
        backgroundColor: Color(0xFF5A7D3A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: subscribers.length,
        itemBuilder: (context, index) {
          final subscriber = subscribers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(subscriber['avatar']!),
            ),
            title: Text(subscriber['name']!),
            trailing: PopupMenuButton<String>(
              icon: Icon(Icons.notifications),
              onSelected: (value) {
                // Handle notification option selected
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'mute',
                  child: Text('Mute'),
                ),
                PopupMenuItem(
                  value: 'unmute',
                  child: Text('Unmute'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
