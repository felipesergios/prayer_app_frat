import 'package:flutter/material.dart';
import 'markdown_reader.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Caminho do arquivo Markdown dentro da pasta de ativos.
    final String initialAssetPath = 'markdown/oracao001.md';

    return Scaffold(
      body: MarkdownReader(initialAssetPath: initialAssetPath),
    );
  }
}
