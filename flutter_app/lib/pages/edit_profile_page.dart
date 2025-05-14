import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController(text: 'Gourav');
  final TextEditingController _phoneController = TextEditingController(text: '12345689855');
  final TextEditingController _emailController = TextEditingController(text: 'gourav@gmail.com');
  final TextEditingController _bioController = TextEditingController(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet ligula odio.');
  final TextEditingController _locationController = TextEditingController(text: 'New York');

  String _selectedProfession = 'Farmer';
  String _selectedCountry = 'America';
  List<String> _selectedLanguages = ['English', 'French'];

  final List<String> professions = ['Farmer', 'Trader', 'Consultant'];
  final List<String> countries = ['America', 'Canada', 'UK'];
  final List<String> languages = ['English', 'French', 'Spanish', 'German'];

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save profile logic
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile saved')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFF5A7D3A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    child: TextButton(
                      onPressed: () {
                        // Change profile picture logic
                      },
                      child: Text('Change', style: TextStyle(color: Colors.green)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildTextField('Full Name', _fullNameController, validator: (v) => v!.isEmpty ? 'Required' : null),
            SizedBox(height: 12),
            _buildTextField('Phone Number', _phoneController, keyboardType: TextInputType.phone, validator: (v) => v!.isEmpty ? 'Required' : null),
            SizedBox(height: 12),
            _buildTextField('Email (optional)', _emailController, keyboardType: TextInputType.emailAddress),
            SizedBox(height: 12),
            _buildDropdown('Profession', professions, _selectedProfession, (val) {
              setState(() {
                _selectedProfession = val!;
              });
            }),
            SizedBox(height: 12),
            _buildMultiSelectDropdown('Languages', languages, _selectedLanguages, (val) {
              setState(() {
                _selectedLanguages = val;
              });
            }),
            SizedBox(height: 12),
            _buildTextField('Bio', _bioController, maxLines: 4),
            SizedBox(height: 12),
            _buildTextField('Location', _locationController),
            SizedBox(height: 12),
            _buildDropdown('Country', countries, _selectedCountry, (val) {
              setState(() {
                _selectedCountry = val!;
              });
            }),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5A7D3A),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: _saveProfile,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1, String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedValue, ValueChanged<String?> onChanged) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          onChanged: onChanged,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        ),
      ),
    );
  }

  Widget _buildMultiSelectDropdown(String label, List<String> items, List<String> selectedValues, ValueChanged<List<String>> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 12)),
        Wrap(
          spacing: 8,
          children: items.map((item) {
            final isSelected = selectedValues.contains(item);
            return FilterChip(
              label: Text(item),
              selected: isSelected,
              onSelected: (selected) {
                final newSelected = List<String>.from(selectedValues);
                if (selected) {
                  newSelected.add(item);
                } else {
                  newSelected.remove(item);
                }
                onChanged(newSelected);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
