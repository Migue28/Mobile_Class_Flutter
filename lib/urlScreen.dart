import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlScreen extends StatefulWidget {
  @override
  _UrlScreenState createState() => _UrlScreenState();
}

/*
 * Se crean los botones con íconos
 * Se inserta el url estático para ir
 */
class _UrlScreenState extends State<UrlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Abre un link con un botón"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton.icon(
            onPressed: () => _launchURL("google.com"),
            icon: FaIcon(FontAwesomeIcons.google),
            label: Text("Google"),
          ),
          FlatButton.icon(
            onPressed: () => _launchURL("www.utp.ac.pa"),
            icon: FaIcon(FontAwesomeIcons.university),
            label: Text("UTP"),
          ),
          FlatButton.icon(
            onPressed: () => _launchURL("ecampus.utp.ac.pa"),
            icon: FaIcon(FontAwesomeIcons.book),
            label: Text("Ecampus"),
          ),
        ],
      ),
    );
  }

  /* Como parámetro se pide el url
   *el https es necesario para ala función launch
   *que es en sí la que abré el navegador
   *Primero verificamos si el url es válido
   */
  _launchURL(String userUrl) async {
    final url = "https://" + userUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("ELSE ERROR");
      throw 'Could not launch $url';
    }
  }
}
