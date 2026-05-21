import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../services/veiculo_service.dart';
import '../screens/veiculo_form_screen.dart';


class VeiculoScreen extends StatefulWidget {
  const VeiculoScreen({super.key});
  @override
  State<VeiculoScreen> createState() => _VeiculoScreenState();
}

class _VeiculoScreenState extends State<VeiculoScreen> {
  final service = VeiculoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Frota de Veículos")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) => const VeiculoFormScreen()));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Veiculo>>(
        future: service.listar(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final frota = snapshot.data!;
          return ListView.builder(
            itemCount: frota.length,
            itemBuilder: (context, i) {
              final v = frota[i];
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.directions_car),
                  title: Text(v.descricao),
                  subtitle: Text("Ano: ${v.ano} | Horas: ${v.horimetro}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () async {
                          await Navigator.push(context, MaterialPageRoute(builder: (_) => VeiculoFormScreen(veiculo: v)));
                          setState(() {});
                      }),
                      IconButton(icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await service.excluir(v.id!);
                          setState(() {});
                      }),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}