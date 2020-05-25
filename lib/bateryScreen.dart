import 'dart:async';

import 'package:battery/battery.dart';
import 'package:flutter/material.dart';

class BatteryScreen extends StatefulWidget {
  @override
  _BatteryScreenState createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  //Declarar las instancias de la batería.
  Battery _battery = Battery();

  StreamSubscription<BatteryState> _batteryStateSubscription;
  int batteryLevel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Cuánta batería tienes?'),
      ),
      /** 
       * Las propiedades mainAxisAlignment, crossAxisAlignment
       * son utilizadas para centrar todos los hijos que se vayan
       * a renderizar
      */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Mientras tanto tu batería...",
            style: TextStyle(fontSize: 30),
          ),
          //Constructor de imagenes que tienen src en el internet
          Image.network(
            "https://wompampsupport.azureedge.net/fetchimage?siteId=7575&v=2&jpgQuality=100&width=700&url=https%3A%2F%2Fi.kym-cdn.com%2Fentries%2Ficons%2Ffacebook%2F000%2F028%2F577%2Fpepelaughz.jpg",
            width: 300,
            height: 300,
          ),
        ],
      ),
      /** 
       * Botón inferior que tiene sombra
       * El cual mostrará cuanta batería tiene disponible
       * el dispositivo que se está utilizando
      */
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.battery_unknown),
        onPressed: () async {
          final int batteryLevel = await _battery.batteryLevel;
          showDialog<void>(
            context: context,
            builder: (_) => AlertDialog(
              content: Text('Batería: $batteryLevel%'),
              actions: <Widget>[
                FlatButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
  //Cerrar el canal que está escuchando a la batería 
  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription.cancel();
    }
  }
}
