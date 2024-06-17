import 'package:flutter/material.dart';
import 'home.dart';
import 'favorites.dart';
import 'prayerling.dart';

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
        backgroundColor:Colors.brown,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
        title: Text("Discípulos na oracão"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.book), text: "Orações"),
            Tab(icon: Icon(Icons.settings), text: "Settings"),
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
              child: Text("Ir para Home"),
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
          Center(child: Text("Settings Page")),
        ],
      ),
    );
  }
}
