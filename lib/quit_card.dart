import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quitter/utils.dart';

class QuitCard extends StatelessWidget {
  const QuitCard({
    super.key,
    required this.context,
    required this.title,
    required this.icon,
    required this.gradientColors,
    required this.quitDate,
    required this.onTap,
    required this.onLongPress,
  });

  final BuildContext context;
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final String? quitDate;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    int? days;
    if (quitDate != null) days = daysCeil(quitDate!);

    return Hero(
      tag: title,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: gradientColors.first.withAlpha(255 ~/ (1 / 0.3)),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              onLongPress: onLongPress,
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.white.withAlpha(255 ~/ (1 / 0.3)),
              highlightColor: Colors.white.withAlpha(255 ~/ (1 / 0.1)),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(
                    context,
                  ).colorScheme.surface.withAlpha(255 ~/ (1 / 0.9)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradientColors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: getContrastingColor(gradientColors.first),
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (days != null) ...[
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: '$days'),
                            TextSpan(
                              text: days == 1 ? ' day' : ' days',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withAlpha(255 ~/ (1 / 0.7)),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Tap to start',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withAlpha(255 ~/ (1 / 0.6)),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],

                    if (quitDate != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withAlpha(255 ~/ (1 / 0.1)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          DateFormat.yMMMd().format(DateTime.parse(quitDate!)),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
