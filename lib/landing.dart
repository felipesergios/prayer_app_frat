import 'package:flutter/material.dart';
import 'social.dart';
import 'MarkdownViewer.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redes Sociais'),
      ),
      body: ListView(
        children: [
          SocialMedia(),
          Container(
            height: 600, // Defina uma altura adequada para o MarkdownViewer
            child: MarkdownViewer(
              githubRepoUrl: 'https://raw.githubusercontent.com/felipesergios/Ansibleauto/main/Deployments/create_linux_vm/',
              markdownFilePath: 'README.md',
              HeaderName: 'Documentos & Outros', // Exemplo de caminho do arquivo Markdown
            ),
          ),
        ],
      ),
    );
  }
}
