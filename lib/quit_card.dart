import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
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
    this.onDelete,
    this.onRename,
  });

  final BuildContext context;
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final String? quitDate;
  final VoidCallback onTap;

  /// When non-null, shows a delete badge in the top-left corner.
  final VoidCallback? onDelete;

  /// When non-null, shows a rename badge in the top-right corner.
  final VoidCallback? onRename;

  @override
  Widget build(BuildContext context) {
    int? days;
    if (quitDate != null) days = daysCeil(quitDate!);

    final card = Hero(
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
                        color: getContrastingColor(gradientColors.last),
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
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
                              text:
                                  AppLocalizations.of(
                                    context,
                                  )?.quitCardKeepDays(days) ??
                                  (days == 1 ? ' day' : ' days'),
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
                        AppLocalizations.of(context)?.quitCardSubtitle ??
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
                      const Spacer(),
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
                          DateFormat.yMMMd(
                            AppLocalizations.of(context)?.localeName,
                          ).format(DateTime.parse(quitDate!)),
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

    if (onDelete == null && onRename == null) return card;

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        card,
        if (onDelete != null)
          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: onDelete,
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: gradientColors.last,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
        if (onRename != null)
          Positioned(
            bottom: 6,
            right: 6,
            child: GestureDetector(
              onTap: onRename,
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 14,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
