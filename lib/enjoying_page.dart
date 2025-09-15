import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EnjoyingPage extends StatelessWidget {
  const EnjoyingPage({super.key});

  Future<void> _requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    } else {
      const url =
          'https://play.google.com/store/apps/details?id=com.quitter.app&showAllReviews=true';
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enjoying the app?")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Leave a review"),
            subtitle: const Text("Let me know what you think!"),
            leading: const Icon(Icons.reviews_outlined),
            onTap: _requestReview,
          ),
          ListTile(
            title: const Text("Give us a star"),
            subtitle: const Text("Show your support on GitHub"),
            leading: const Icon(Icons.star_outline),
            onTap: () async {
              const url = 'https://github.com/brandonp2412/Quitter';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("Donate"),
            subtitle: const Text("Support development"),
            leading: const Icon(Icons.favorite_outline),
            onTap: () async {
              const url = 'https://github.com/sponsors/brandonp2412';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
        ],
      ),
    );
  }
}
