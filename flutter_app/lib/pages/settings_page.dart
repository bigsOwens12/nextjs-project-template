import 'package:flutter/material.dart';
import 'notification_dialog.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: Color(0xFF5A7D3A), // green color from screenshot
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'MANAGE ACCOUNT',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8),
          _buildListItem(context, 'Language', 'English', () {
            Navigator.pushNamed(context, '/language');
          }),
          _buildListItem(context, 'Subscribed Channel', null, () {
            Navigator.pushNamed(context, '/subscribed_channel');
          }),
          _buildListItem(context, 'My Orders', null, () {
            Navigator.pushNamed(context, '/my_orders');
          }),
          _buildListItem(context, 'Get Daali Premium', null, () {
            Navigator.pushNamed(context, '/daali_premium');
          }),
          SizedBox(height: 24),
          Text(
            'APP SETTINGS',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8),
          _buildListItem(context, 'Notifications', 'Push notification Allowed', () {
            showDialog(
              context: context,
              builder: (context) => NotificationDialog(),
            );
          }),
          _buildListItem(context, 'Support', null, () {
            Navigator.pushNamed(context, '/support');
          }),
          _buildListItem(context, 'Privacy Policy', null, () {
            Navigator.pushNamed(context, '/privacy_policy');
          }),
          _buildListItem(context, 'Logout', null, () {
            showDialog(
              context: context,
              builder: (context) => LogoutDialog(),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, String? subtitle, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (subtitle != null)
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
          onTap: onTap,
        ),
        Divider(height: 1),
      ],
    );
  }
}
