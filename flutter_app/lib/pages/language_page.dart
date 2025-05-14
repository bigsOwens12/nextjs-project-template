import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String? _selectedLanguage = 'French';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        backgroundColor: Color(0xFF5A7D3A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          RadioListTile<String>(
            title: Text('French'),
            value: 'French',
            groupValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Moore'),
            value: 'Moore',
            groupValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Peul'),
            value: 'Peul',
            groupValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Bambara'),
            value: 'Bambara',
            groupValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5A7D3A),
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {
                // Save language selection logic here
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
