import 'package:flutter/material.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  bool _pushNotification = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Notification'),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Do not miss out on important information on the app. We strongly recommend you turn on push notification',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Push Notification'),
              Switch(
                value: _pushNotification,
                onChanged: (value) {
                  setState(() {
                    _pushNotification = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
