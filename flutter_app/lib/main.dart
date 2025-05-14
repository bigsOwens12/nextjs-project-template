import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';
import 'pages/language_page.dart';
import 'pages/my_orders_page.dart';
import 'pages/rating_review_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Green Themed Flutter App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
        '/language': (context) => LanguagePage(),
        '/my_orders': (context) => MyOrdersPage(),
        '/rating_review': (context) => RatingReviewPage(),
        '/support': (context) => SupportPage(),
        '/privacy_policy': (context) => PrivacyPolicyPage(),
        '/daali_premium': (context) => DaaliPremiumPage(),
        '/subscribed_channel': (context) => SubscribedChannelPage(),
        '/profile': (context) => ProfilePage(),
        '/item_detail': (context) => ItemDetailPage(),
        '/profile_items': (context) => ProfileItemsPage(),
        '/edit_profile': (context) => EditProfilePage(),
        '/video_detail': (context) => VideoDetailPage(),
        '/video_comments': (context) => VideoCommentsPage(),
        // Add other routes here for other pages
      },
    );
  }
}
