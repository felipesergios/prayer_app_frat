import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'title': 'Iniciais', 'route': '/prayerling', 'initialAssetPath': 'markdown/oracao001.md'},
    {'title': 'Pelo Clero', 'route': '/prayerling/peloclero', 'initialAssetPath': 'markdown/oracao002.md'},
    {'title': 'Pelas Almas', 'route': '/prayerling', 'initialAssetPath': 'markdown/oracao003.md'},
    {'title': 'Das Virtudes', 'route': '/prayerling', 'initialAssetPath': 'markdown/oracao004.md'},
    // Adicione mais itens aqui conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['title']),
            onTap: () {
              Navigator.pushNamed(
                context,
                items[index]['route'],
                arguments: items[index]['initialAssetPath'], // Passa o initialAssetPath como argumento
              );
            },
          );
        },
      ),
    );
  }
}
