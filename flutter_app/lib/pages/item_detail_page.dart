import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int _currentImageIndex = 0;
  bool _isDescriptionExpanded = false;

  final List<String> images = [
    'https://via.placeholder.com/300x300?text=Flax+Seed+1',
    'https://via.placeholder.com/300x300?text=Flax+Seed+2',
    'https://via.placeholder.com/300x300?text=Flax+Seed+3',
  ];

  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet ligula odio. Sed dapibus eu nisl non venenatis.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
        backgroundColor: Color(0xFF5A7D3A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu actions
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Text('Edit item'),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text('Delete item'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            height: 300,
            child: PageView.builder(
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentImageIndex == index ? 12 : 8,
                height: _currentImageIndex == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImageIndex == index ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Flax Seeds',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$2,000',
            style: TextStyle(fontSize: 20, color: Colors.grey[700]),
          ),
          SizedBox(height: 16),
          _buildSectionTitle('Description'),
          _buildExpandableText(description),
          SizedBox(height: 16),
          _buildDetailRow('Item Form', 'Powder'),
          _buildDetailRow('Item Weight', '5 Kilograms'),
          _buildDetailRow('Category', 'Fertilizer'),
          SizedBox(height: 16),
          _buildSectionTitle('Ingredients'),
          Text(description),
          SizedBox(height: 16),
          _buildSectionTitle('Directions'),
          Text(description),
          SizedBox(height: 16),
          _buildSectionTitle('Customer reviews'),
          ListTile(
            title: Text('4.3 out of 5 (992 ratings)'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to reviews page
            },
          ),
          _buildReview(
            'Ronald Richards',
            4,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
          ),
          _buildReview(
            'Ronald Richards',
            4,
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            showAvatar: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _buildExpandableText(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isDescriptionExpanded ? text : (text.length > 100 ? text.substring(0, 100) + '...' : text),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isDescriptionExpanded = !_isDescriptionExpanded;
            });
          },
          child: Text(
            _isDescriptionExpanded ? 'Read less' : 'Read more',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(fontWeight: FontWeight.bold))),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildReview(String name, int rating, String comment, {bool showAvatar = false}) {
    return ListTile(
      leading: showAvatar
          ? CircleAvatar(
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
            )
          : null,
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 16,
              ),
            ),
          ),
          Text(comment),
        ],
      ),
    );
  }
}
