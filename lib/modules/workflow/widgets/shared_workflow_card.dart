import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviepilot_mobile/modules/workflow/models/workflow_models.dart';
import 'package:moviepilot_mobile/theme/section.dart';

class SharedWorkflowCard extends StatelessWidget {
  const SharedWorkflowCard({
    super.key,
    required this.workflow,
    required this.onFork,
  });

  final SharedWorkflow workflow;
  final VoidCallback onFork;

  static const double _cardRadius = 12;
  static const Color _themeColor = Color(
    0xFF6366F1,
  ); // Indigo color for workflow cards

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Section(
        padding: const EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_cardRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_buildDarkSection(context), _buildLightSection(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildDarkSection(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withAlpha(230), _themeColor.withAlpha(200)],
          ),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workflow.shareTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (workflow.shareComment != null &&
                workflow.shareComment!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                workflow.shareComment!,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withAlpha(200),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 14,
                  color: Colors.white.withAlpha(180),
                ),
                const SizedBox(width: 4),
                Text(
                  workflow.shareUser,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withAlpha(180),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 14,
                  color: Colors.white.withAlpha(180),
                ),
                const SizedBox(width: 4),
                Text(
                  workflow.date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withAlpha(180),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLightSection(BuildContext context) {
    final surfaceColor = Theme.of(context).colorScheme.surfaceContainerHighest;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Container(
      color: surfaceColor,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workflow.name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (workflow.timer != null && workflow.timer!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                        size: 12,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        workflow.timer!,
                        style: TextStyle(
                          fontSize: 11,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          CupertinoButton.filled(
            onPressed: onFork,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            minSize: 28,
            child: const Text(
              '复刻',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
