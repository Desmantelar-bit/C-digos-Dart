import 'package:agriapp/screens/home_screen.dart';
import 'package:agriapp/screens/marca_screen.dart';
import 'package:agriapp/screens/modelo_screen.dart';
import 'package:agriapp/screens/veiculo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AgriaApp());
}

class AgriaApp extends StatelessWidget {
  const AgriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/marca': (context) => MarcaScreen(),
        '/modelo': (context) => ModeloScreen(),
        '/veiculo': (context) => VeiculoScreen(),
      }
    );
  }
}