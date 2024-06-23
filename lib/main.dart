import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';
import 'favorites.dart';
import 'prayerling.dart';
import 'MarkdownViewer.dart';
import 'social.dart';
import 'landing.dart';
import 'socialmedia.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => StartComponent(),
        '/home': (context) => HomePage(),
        '/favorites': (context) => FavoritesPage(),
        '/prayerling': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao001.md',),
        '/prayerling/peloclero': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao002.md',),
        '/prayerling/pelasalmas': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao003.md',),
        '/prayerling/dasvirtudes': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao004.md',),
        '/prayerling/suplicadiaria': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao005.md',),
        '/prayerling/amaria': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao006.md',),
        '/prayerling/danoite': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao007.md',),
        '/prayerling/rosariomonfort': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao008.md',),
        '/prayerling/exame': (context) => PrayerlingPage(initialAssetPath: 'markdown/oracao009.md',),
      },
    );
  }
}

class StartComponent extends StatefulWidget {
  @override
  _StartComponentState createState() => _StartComponentState();
}

class _StartComponentState extends State<StartComponent> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor:Colors.blueAccent,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
        title: Text("Discípulos na oracão"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(FontAwesomeIcons.house,), text: "Início"),
            Tab(icon: Icon(FontAwesomeIcons.handsPraying), text: "Orações"),
            Tab(icon: Icon(FontAwesomeIcons.fileAudio), text: "Mídias"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: MarkdownViewer(
                    githubRepoUrl: 'https://raw.githubusercontent.com/felipesergios/Ansibleauto/main/Deployments/create_linux_vm/',
                    markdownFilePath: 'README.md',
                    HeaderName: 'Teste', // Exemplo de caminho do arquivo Markdown
                  ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/prayerling');
              },
              child: HomePage(),
            ),
          ),
          Center(child: Landing()),
        ],
      ),
    );
  }
}
