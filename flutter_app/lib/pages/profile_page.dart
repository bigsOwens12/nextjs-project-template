import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName = 'Gourav';
  final String userRole = 'Farmer';
  final String userBio = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet ligula odio.';
  final String userLocation = 'New York, America';
  final int postsCount = 8;
  final int itemsCount = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF5A7D3A),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings or edit profile
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              '$userName ($userRole)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              userBio,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              userLocation,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCountColumn('Posts', postsCount),
              _buildCountColumn('Items', itemsCount),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5A7D3A),
                  minimumSize: Size(150, 40),
                ),
                onPressed: () {
                  // Edit profile action
                },
                child: Text('Edit Profile'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(150, 40),
                ),
                onPressed: () {
                  // Share profile action
                },
                child: Text('Share Profile'),
              ),
            ],
          ),
          SizedBox(height: 24),
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/350x150'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(12),
            child: Text(
              'Best tips on Farming & Agriculture',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 4, color: Colors.black45, offset: Offset(1, 1))],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountColumn(String label, int count) {
    return Column(
      children: [
        Text(
          '$count',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }
}
