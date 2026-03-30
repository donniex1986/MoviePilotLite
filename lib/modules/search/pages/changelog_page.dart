import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        SelectableText(
          content,
          style: const TextStyle(height: 1.6, fontSize: 14),
        ),
      ],
    );
  }
}
