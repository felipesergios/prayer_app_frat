import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedia extends StatelessWidget {
  // Função para abrir o URL usando o url_launcher
  void _launchURL(String urlString) async {
    try {
      if (await canLaunch(urlString)) {
        await launch(urlString, forceWebView: false);
      } else {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      print('Error launching URL: $e');
      // Trate o erro conforme necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
            onPressed: () {
              _launchURL('https://www.youtube.com/fratmaededeus');
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
            onPressed: () {
              _launchURL('https://www.instagram.com/discipulosdamaededeus');
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.lightBlue),
            onPressed: () {
              _launchURL('https://www.instagram.com/maramariafdmd');
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.globe, color: Colors.brown),
            onPressed: () {
              _launchURL('https://www.discipulosdamaededeus.com.br');
            },
          ),
        ],
      ),
    );
  }
}
