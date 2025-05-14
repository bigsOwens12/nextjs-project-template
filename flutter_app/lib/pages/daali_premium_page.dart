import 'package:flutter/material.dart';

class DaaliPremiumPage extends StatefulWidget {
  @override
  _DaaliPremiumPageState createState() => _DaaliPremiumPageState();
}

class _DaaliPremiumPageState extends State<DaaliPremiumPage> {
  String _selectedPlan = 'Annually';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daali Premium'),
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
            Text(
              'Choose a plan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(
              "Monthly or yearly? It's your call",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            SizedBox(height: 16),
            _buildPlanOption(
              title: 'Monthly',
              price: '\$12.99 /month',
              selected: _selectedPlan == 'Monthly',
              onTap: () {
                setState(() {
                  _selectedPlan = 'Monthly';
                });
              },
            ),
            SizedBox(height: 12),
            _buildPlanOption(
              title: 'Annually',
              price: '\$120.00 /year',
              selected: _selectedPlan == 'Annually',
              badge: 'Save 10%',
              onTap: () {
                setState(() {
                  _selectedPlan = 'Annually';
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Features',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            _buildFeature('Lorem ipsum dolor sit amet'),
            _buildFeature('Lorem ipsum dolor sit amet'),
            _buildFeature('Lorem ipsum dolor sit amet'),
            _buildFeature('Lorem ipsum dolor sit amet'),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5A7D3A),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // Go to payment logic
                },
                child: Text('Go to payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanOption({
    required String title,
    required String price,
    required bool selected,
    String? badge,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          border: Border.all(
            color: selected ? Color(0xFF5A7D3A) : Colors.grey,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Radio<String>(
              value: title,
              groupValue: _selectedPlan,
              onChanged: (value) {
                if (value != null) {
                  onTap();
                }
              },
              activeColor: Color(0xFF5A7D3A),
            ),
            SizedBox(width: 8),
            Text(title, style: TextStyle(fontSize: 16)),
            Spacer(),
            if (badge != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            SizedBox(width: 8),
            Text(price, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check, color: Color(0xFF5A7D3A)),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
