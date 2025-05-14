import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    // Handle submit logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Message submitted')),
    );
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
        backgroundColor: Color(0xFF5A7D3A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Send us a message', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            TextField(
              controller: _messageController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Have any query or having issues with our app? send us a message',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'By clicking submit, you acknowledge that our team may review diagnostic and performance information and the metadata associated with your account to try to troubleshoot and solve your reported issue.',
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5A7D3A),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
