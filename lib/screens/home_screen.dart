import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _botaoMenu(context, 'Veículos', Icons.directions_car, '/veiculo', Colors.blue),
            _botaoMenu(context, 'Clientes', Icons.people, '/cliente', Colors.green),
            _botaoMenu(context, 'Locações', Icons.assignment, '/locacao', Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _botaoMenu(context, texto, icone, rota, cor) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icone, color: cor),
        title: Text(texto, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.pushNamed(context, rota),
      ),
    );

  }
}