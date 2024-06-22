import 'package:flutter/material.dart';
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
  String _markdownContent = '';
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadMarkdownContent();
  }

  Future<void> _loadMarkdownContent() async {
    try {
      final url = Uri.parse('${widget.githubRepoUrl}/${widget.markdownFilePath}');
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
        print('Failed to load Markdown file: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      print('Failed to load Markdown file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markdown Viewer'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _hasError
              ? Center(child: Text('Failed to load Markdown file'))
              : Markdown(data: _markdownContent),
    );
  }
}