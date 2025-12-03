import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EnjoyingPage extends StatelessWidget {
  const EnjoyingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.enjoyingPageTitle),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context)!.enjoyingLeaveReview),
              subtitle: Text(
                AppLocalizations.of(context)!.enjoyingLeaveReviewSubtitle,
              ),
              leading: const Icon(Icons.reviews_outlined),
              onTap: () => launchUrlString(
                'https://play.google.com/store/apps/details?id=com.quitter.app&showAllReviews=true',
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.enjoyingGiveStar),
              subtitle: Text(
                AppLocalizations.of(context)!.enjoyingGiveStarSubtitle,
              ),
              leading: const Icon(Icons.star_outline),
              onTap: () async {
                const url = 'https://github.com/brandonp2412/Quitter';
                await launchUrlString(url);
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.enjoyingDonate),
              subtitle: Text(
                AppLocalizations.of(context)!.enjoyingDonateSubtitle,
              ),
              leading: const Icon(Icons.favorite_outline),
              onTap: () async {
                const url = 'https://github.com/sponsors/brandonp2412';
                await launchUrlString(url);
              },
            ),
          ],
        ),
      ),
    );
  }
}
