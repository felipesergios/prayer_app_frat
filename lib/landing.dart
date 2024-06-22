import 'package:flutter/material.dart';
import 'social.dart';
import 'MarkdownViewer.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mídias e documentos'),
      ),
      body: ListView(
        children: [
          SocialMedia(),
          MarkdownViewer(
                    githubRepoUrl: 'https://raw.githubusercontent.com/felipesergios/Ansibleauto/main/Deployments/create_linux_vm/',
                    markdownFilePath: 'README.md', // Exemplo de caminho do arquivo Markdown
                  ),
          

          ListTile(
            title: Text('Item 1'),
            subtitle: Text('Description for Item 1'),
            leading: Icon(Icons.check_circle_outline),
            onTap: () {
              // Ação ao clicar no item (opcional)
              print('Item 1 tapped');
            },
          ),
          ListTile(
            title: Text('Item 2'),
            subtitle: Text('Description for Item 2'),
            leading: Icon(Icons.check_circle_outline),
            onTap: () {
              // Ação ao clicar no item (opcional)
              print('Item 2 tapped');
            },
          ),
          ListTile(
            title: Text('Item 3'),
            subtitle: Text('Description for Item 3'),
            leading: Icon(Icons.check_circle_outline),
            onTap: () {
              // Ação ao clicar no item (opcional)
              print('Item 3 tapped');
            },
          ),
        ],
      ),
    );
  }
}
