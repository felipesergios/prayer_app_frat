import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'title': 'Iniciais', 'route': '/prayerling', 'initialAssetPath': 'markdown/oracao001.md', 'icon': Icons.access_alarm},
    {'title': 'Pelo Clero', 'route': '/prayerling/peloclero', 'initialAssetPath': 'markdown/oracao002.md', 'icon': Icons.church_rounded},
    {'title': 'Pelas Almas', 'route': '/prayerling/pelasalmas', 'initialAssetPath': 'markdown/oracao003.md', 'icon': Icons.people_alt},
    {'title': 'Das Virtudes', 'route': '/prayerling/dasvirtudes', 'initialAssetPath': 'markdown/oracao004.md', 'icon': Icons.account_balance},
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
            leading: Icon(items[index]['icon']), // Ícone à esquerda do título
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
