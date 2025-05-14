import 'package:flutter/material.dart';

class VideoDetailPage extends StatefulWidget {
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  bool _isDescriptionExpanded = false;

  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet ligula odio. Sed dapibus eu nisl non venenatis.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best tips on'),
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
                child: Text('Edit video'),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text('Delete video'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/350x180'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(12),
            child: Text(
              'Farming & Agriculture',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 4, color: Colors.black45, offset: Offset(1, 1))],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Best tips for Farming & Agriculture',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '28 February 2025',
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 12),
          _buildExpandableText(description),
          SizedBox(height: 16),
          _buildAnalytics(),
          SizedBox(height: 16),
          _buildCommentsSection(),
        ],
      ),
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

  Widget _buildAnalytics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAnalyticsItem('Views', '252'),
        _buildAnalyticsItem('Watch Time (hours)', '2.5'),
        _buildAnalyticsItem('Likes', '45'),
      ],
    );
  }

  Widget _buildAnalyticsItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildCommentsSection() {
    final comments = [
      {'name': 'Ronald Richards', 'date': 'Feb 28, 2025', 'comment': 'Lorem ipsum dolor sit amet, consec tetur adipiscing elit.'},
      {'name': 'Ronald Richards', 'date': 'Feb 28, 2025', 'comment': 'Lorem ipsum dolor sit amet, consec tetur adipiscing elit.'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Comments (10)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextButton(
              onPressed: () {
                // View all comments
              },
              child: Text('View all'),
            ),
          ],
        ),
        ...comments.map((c) => ListTile(
              title: Text(c['name']!),
              subtitle: Text('${c['date']} - ${c['comment']}'),
              trailing: Icon(Icons.more_vert),
            )),
      ],
    );
  }
}
