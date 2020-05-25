import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_project/bateryScreen.dart';

import './listViewScreen.dart';
import './urlScreen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

//Llamada a las otras pantallas
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  
  List<Widget> _widgetOptions = <Widget>[
    RandomWords(),
    UrlScreen(),
    BatteryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Se le colocan los íconos en 
  //la barra de navegación inferior
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookOpen),
            title: Text('List View'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidImages),
            title: Text('Abrir url'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.batteryFull),
            title: Text('Info de Batería'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
