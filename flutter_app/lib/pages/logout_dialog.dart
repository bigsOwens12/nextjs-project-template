import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout'),
      content: Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black87,
            primary: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF5A7D3A),
            primary: Colors.white,
          ),
          onPressed: () {
            // Handle logout logic here
            Navigator.of(context).pop();
          },
          child: Text('Logout'),
        ),
      ],
    );
  }
}
