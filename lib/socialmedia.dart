import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingSocialMediaWidget extends StatelessWidget {
  // Função para abrir o URL usando o url_launcher
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSocialMediaRow(
            icon: FontAwesomeIcons.facebook,
            color: Colors.blue,
            text: 'Facebook',
            url: 'https://www.facebook.com',
          ),
          _buildSocialMediaRow(
            icon: FontAwesomeIcons.instagram,
            color: Colors.purple,
            text: 'Instagram',
            url: 'https://www.instagram.com',
          ),
          _buildSocialMediaRow(
            icon: FontAwesomeIcons.twitter,
            color: Colors.lightBlue,
            text: 'Twitter',
            url: 'https://www.twitter.com',
          ),
          _buildSocialMediaRow(
            icon: FontAwesomeIcons.linkedin,
            color: Colors.blueAccent,
            text: 'LinkedIn',
            url: 'https://www.linkedin.com',
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaRow({
    required IconData icon,
    required Color color,
    required String text,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            FaIcon(icon, color: color),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}