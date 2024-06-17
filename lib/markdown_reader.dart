import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart' show rootBundle;

class MarkdownReader extends StatefulWidget {
  final String? initialAssetPath;

  MarkdownReader({this.initialAssetPath});

  @override
  _MarkdownReaderState createState() => _MarkdownReaderState();
}

class _MarkdownReaderState extends State<MarkdownReader> {
  double _fontSize = 14.0;
  String _markdownContent = '';

  @override
  void initState() {
    super.initState();
    if (widget.initialAssetPath != null) {
      _loadAsset(widget.initialAssetPath!);
    }
  }

  Future<void> _loadAsset(String path) async {
    String content = await rootBundle.loadString(path);
    setState(() {
      _markdownContent = content;
    });
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize = _fontSize > 10 ? _fontSize - 2 : _fontSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Em oração..'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _increaseFontSize,
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: _decreaseFontSize,
          ),
        ],
      ),
      body: _markdownContent.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(8.0),
              child: Markdown(
                data: _markdownContent,
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(fontSize: _fontSize),
                ),
              ),
            ),
    );
  }
}
