import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlScreen extends StatefulWidget {
  @override
  _UrlScreenState createState() => _UrlScreenState();
}

class _UrlScreenState extends State<UrlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: _launchURL,
          child: Text('Show Flutter homepage'),
        ),
      ),
    );
  }

   _launchURL() async {
     print("ENTRO?");
    const url = 'https://google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("ELSE ERROR");
      throw 'Could not launch $url';
    }
  }
}
