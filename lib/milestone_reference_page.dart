import 'package:flutter/material.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:url_launcher/url_launcher.dart';

class MilestoneReferencePage extends StatelessWidget {
  final QuitMilestone milestone;

  const MilestoneReferencePage({super.key, required this.milestone});

  /// Parses the flat reference string into structured blocks for rendering.
  List<_ContentBlock> _parseContent(String content) {
    final blocks = content.split('\n\n');
    final result = <_ContentBlock>[];

    for (var i = 0; i < blocks.length; i++) {
      final block = blocks[i].trim();
      if (block.isEmpty) continue;

      if (i == 0) {
        result.add(_ContentBlock.articleTitle(block));
        continue;
      }

      if (block.contains('\n')) {
        final firstNewline = block.indexOf('\n');
        final firstLine = block.substring(0, firstNewline).trim();
        final rest = block.substring(firstNewline + 1).trim();

        // Heuristic: first line is a section header if it's short and doesn't
        // end with sentence-ending punctuation.
        final looksLikeHeader =
            firstLine.length < 80 &&
            !firstLine.endsWith('.') &&
            !firstLine.endsWith(',') &&
            !firstLine.endsWith(':');

        if (looksLikeHeader) {
          final bodyLines = rest.split('\n');
          final bullets = <String>[];
          final prose = <String>[];
          for (final line in bodyLines) {
            if (line.trimLeft().startsWith('•')) {
              bullets.add(line.trimLeft().substring(1).trim());
            } else if (line.trim().isNotEmpty) {
              prose.add(line.trim());
            }
          }
          result.add(
            _ContentBlock.section(
              header: firstLine,
              prose: prose.join('\n'),
              bullets: bullets,
            ),
          );
          continue;
        }
      }

      // Plain paragraph — may contain bullets.
      final lines = block.split('\n');
      final bullets = <String>[];
      final prose = <String>[];
      for (final line in lines) {
        if (line.trimLeft().startsWith('•')) {
          bullets.add(line.trimLeft().substring(1).trim());
        } else if (line.trim().isNotEmpty) {
          prose.add(line.trim());
        }
      }
      result.add(
        _ContentBlock.section(
          header: null,
          prose: prose.join('\n'),
          bullets: bullets,
        ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final content = milestone.referenceContent ?? '';
    final blocks = _parseContent(content);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(title: Text(milestone.title)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Source + date row
                  Row(
                    children: [
                      Icon(Icons.science, size: 16, color: colorScheme.primary),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          milestone.reference,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (milestone.referenceDate != null) ...[
                    const SizedBox(width: 8, height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Retrieved ${milestone.referenceDate}',
                        style: TextStyle(
                          fontSize: 11,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Divider(color: colorScheme.outlineVariant),
                  const SizedBox(height: 8),

                  // Rendered content blocks
                  ...blocks.map((block) => _BlockWidget(block: block)),

                  const SizedBox(height: 32),

                  // Open source button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => launchUrl(
                        Uri.parse(milestone.link),
                        mode: LaunchMode.externalApplication,
                      ),
                      icon: const Icon(Icons.open_in_new, size: 18),
                      label: const Text('Open Original Source'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    milestone.link,
                    style: TextStyle(
                      fontSize: 11,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Data model for a parsed content block
// ---------------------------------------------------------------------------

enum _BlockType { articleTitle, section }

class _ContentBlock {
  final _BlockType type;
  final String? header;
  final String prose;
  final List<String> bullets;

  const _ContentBlock._({
    required this.type,
    this.header,
    this.prose = '',
    this.bullets = const [],
  });

  factory _ContentBlock.articleTitle(String title) =>
      _ContentBlock._(type: _BlockType.articleTitle, prose: title);

  factory _ContentBlock.section({
    required String? header,
    required String prose,
    required List<String> bullets,
  }) => _ContentBlock._(
    type: _BlockType.section,
    header: header,
    prose: prose,
    bullets: bullets,
  );
}

// ---------------------------------------------------------------------------
// Widget for a single content block
// ---------------------------------------------------------------------------

class _BlockWidget extends StatelessWidget {
  final _ContentBlock block;

  const _BlockWidget({required this.block});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    if (block.type == _BlockType.articleTitle) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
          block.prose,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (block.header != null) ...[
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 3,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      block.header!,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (block.prose.isNotEmpty)
            Text(
              block.prose,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.65,
                color: colorScheme.onSurface.withAlpha(220),
              ),
            ),
          if (block.bullets.isNotEmpty) ...[
            if (block.prose.isNotEmpty) const SizedBox(height: 10),
            ...block.bullets.map(
              (bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        bullet,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.55,
                          color: colorScheme.onSurface.withAlpha(220),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
