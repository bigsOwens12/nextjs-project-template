import 'package:flutter/material.dart';

class VideoCommentsPage extends StatelessWidget {
  final Map<String, List<Map<String, String>>> commentsByDate = {
    '28 February 2025': [
      {
        'name': 'Ronald Richards',
        'date': 'Feb 28, 2025',
        'comment': 'Lorem ipsum dolor sit amet, consec tetur adipiscing elit.',
        'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      },
      {
        'name': 'Ronald Richards',
        'date': 'Feb 28, 2025',
        'comment': 'Lorem ipsum dolor sit amet, consec tetur adipiscing elit.',
        'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      },
    ],
    '01 March 2025': [
      {
        'name': 'Ronald Richards',
        'date': 'Mar 01, 2025',
        'comment': 'Lorem ipsum dolor sit amet, consec tetur adipiscing elit.',
        'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      },
      {
        'name': 'Ronald Richards',
        'date': 'Mar 01, 2025',
        'comment': 'Lorem ipsum dolor sit amet, consec tetur adipiscing elit.',
        'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      },
      {
        'name': 'Ronald Richards',
        'date': 'Mar 01, 2025',
        'comment': 'Lorem ipsum dolor sit amet, consec tetur adipiscing elit.',
        'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Comments'),
        backgroundColor: Color(0xFF5A7D3A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: commentsByDate.entries.map((entry) {
          final date = entry.key;
          final comments = entry.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              ...comments.map((comment) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(comment['avatar']!),
                    ),
                    title: Text(comment['name']!),
                    subtitle: Text(comment['comment']!),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        // Handle menu actions
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }
}
