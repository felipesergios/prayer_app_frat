import 'package:flutter/material.dart';
import 'markdown_reader.dart';

class PrayerlingPage extends StatelessWidget {
  final String initialAssetPath;

  PrayerlingPage({required this.initialAssetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MarkdownReader(initialAssetPath: initialAssetPath),
    );
  }
}
