import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:url_launcher/url_launcher.dart';

class TimelineTile extends StatelessWidget {
  final QuitMilestone milestone;
  final bool isCompleted;
  final bool isNext;
  final bool isLast;

  const TimelineTile({
    super.key,
    required this.milestone,
    required this.isCompleted,
    required this.isNext,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? colorScheme.primary
                        : isNext
                        ? colorScheme.secondary
                        : colorScheme.outline.withAlpha((255 * 0.3).round()),
                    border: Border.all(
                      color: isCompleted
                          ? colorScheme.primary
                          : isNext
                          ? colorScheme.secondary
                          : colorScheme.outline,
                      width: 2,
                    ),
                  ),
                  child: isCompleted
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: colorScheme.onPrimary,
                        )
                      : isNext
                      ? Icon(
                          Icons.radio_button_unchecked,
                          size: 12,
                          color: colorScheme.onSecondary,
                        )
                      : null,
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? colorScheme.primary
                            : colorScheme.outline.withAlpha(
                                (255 * 0.3).round(),
                              ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withAlpha((255 * 0.05).round()),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: isNext
                    ? Border.all(color: colorScheme.secondary, width: 2)
                    : Border.all(
                        color: colorScheme.outline.withAlpha(
                          (255 * 0.1).round(),
                        ),
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isCompleted
                              ? colorScheme.primary
                              : isNext
                              ? colorScheme.secondary
                              : colorScheme.outline.withAlpha(
                                  (255 * 0.3).round(),
                                ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          milestone.day >= 365
                              ? '${(milestone.day / 365).toStringAsFixed(0)} Year${milestone.day >= 730 ? 's' : ''}'
                              : 'Day ${milestone.day}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isCompleted
                                ? colorScheme.onPrimary
                                : isNext
                                ? colorScheme.onSecondary
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    milestone.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isCompleted
                          ? colorScheme.primary
                          : isNext
                          ? colorScheme.secondary
                          : colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    milestone.description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => launchUrl(Uri.parse(milestone.link)),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.science,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              milestone.reference,
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onSurfaceVariant,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
