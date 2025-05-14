import 'package:flutter/material.dart';

class RatingReviewPage extends StatefulWidget {
  @override
  _RatingReviewPageState createState() => _RatingReviewPageState();
}

class _RatingReviewPageState extends State<RatingReviewPage> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  Widget _buildStar(int index) {
    if (index < _rating) {
      return IconButton(
        icon: Icon(Icons.star, color: Colors.amber),
        onPressed: () {
          setState(() {
            _rating = index + 1;
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.star_border, color: Colors.grey),
        onPressed: () {
          setState(() {
            _rating = index + 1;
          });
        },
      );
    }
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating & Review'),
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
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(8),
                leading: Image.network(
                  'https://via.placeholder.com/50',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text('Flax Seeds'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$2,000'),
                    Text('5 kilogram'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'How is your order?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: List.generate(5, (index) => _buildStar(index)),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Tell us about your experience',
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5A7D3A),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // Submit review logic
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
