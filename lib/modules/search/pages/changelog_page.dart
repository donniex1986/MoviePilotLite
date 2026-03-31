import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ChangelogPage extends StatefulWidget {
  const ChangelogPage({super.key});

  @override
  State<ChangelogPage> createState() => _ChangelogPageState();
}

class _ChangelogPageState extends State<ChangelogPage> {
  String? _content;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadChangelog();
  }

  Future<void> _loadChangelog() async {
    try {
      final text = await rootBundle.loadString('CHANGELOG.md');
      if (!mounted) return;
      setState(() {
        _content = text;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _content = null;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('更新日志'), centerTitle: false),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    final content = _content;
    if (content == null || content.trim().isEmpty) {
      return Center(
        child: Text(
          '暂无更新日志',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      );
    }
    final sections = _parseSections(content);
    if (sections.isEmpty) {
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          MarkdownBody(
            data: content,
            selectable: true,
            styleSheet: _markdownStyle(context),
          ),
        ],
      );
    }

    final latest = sections.first;
    final olderSections = sections.skip(1).toList();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        Text(
          '最新更新',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        _buildLatestCard(context, latest),
        if (olderSections.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(
            '历史版本',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ...olderSections.map((section) => _buildHistoryCard(context, section)),
        ],
      ],
    );
  }

  Widget _buildLatestCard(BuildContext context, _ChangelogSection section) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section.title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            MarkdownBody(
              data: section.body,
              selectable: true,
              styleSheet: _markdownStyle(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, _ChangelogSection section) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        title: Text(
          section.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
        tilePadding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          MarkdownBody(
            data: section.body,
            selectable: true,
            styleSheet: _markdownStyle(context),
          ),
        ],
      ),
    );
  }

  List<_ChangelogSection> _parseSections(String markdown) {
    final lines = markdown.split('\n');
    final sections = <_ChangelogSection>[];
    String? currentTitle;
    final currentBody = <String>[];

    void flushCurrent() {
      if (currentTitle == null) return;
      final body = currentBody.join('\n').trim();
      if (body.isNotEmpty) {
        sections.add(_ChangelogSection(title: currentTitle!, body: body));
      }
      currentBody.clear();
    }

    for (final rawLine in lines) {
      final line = rawLine.trimRight();
      if (line.startsWith('## ')) {
        flushCurrent();
        currentTitle = line.substring(3).trim();
        continue;
      }
      if (currentTitle != null) {
        currentBody.add(line);
      }
    }
    flushCurrent();
    return sections;
  }

  MarkdownStyleSheet _markdownStyle(BuildContext context) {
    return MarkdownStyleSheet(
      p: const TextStyle(height: 1.6, fontSize: 14),
      h1: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      h2: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      h3: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      listBullet: TextStyle(
        fontSize: 14,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _ChangelogSection {
  const _ChangelogSection({required this.title, required this.body});

  final String title;
  final String body;
}
