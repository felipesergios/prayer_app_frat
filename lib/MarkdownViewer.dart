import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownViewer extends StatefulWidget {
  final String githubRepoUrl;
  final String markdownFilePath;

  MarkdownViewer({required this.githubRepoUrl, required this.markdownFilePath});

  @override
  _MarkdownViewerState createState() => _MarkdownViewerState();
}

class _MarkdownViewerState extends State<MarkdownViewer> {
  late Future<String> _markdownFuture;
  late String _markdownContent;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadMarkdownContent();
  }

  Future<void> _loadMarkdownContent() async {
    try {
      final url = Uri.https(widget.githubRepoUrl, widget.markdownFilePath);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _markdownContent = response.body;
          _isLoading = false;
          _hasError = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Markdown Viewer'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (_hasError) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Markdown Viewer'),
        ),
        body: Center(
          child: Text('Failed to load Markdown file'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Markdown Viewer'),
        ),
        body: Markdown(data: _markdownContent),
      );
    }
  }
}
