import 'package:agriapp/models/modelo.dart';
import 'package:agriapp/services/modelo_service.dart';
import 'package:flutter/material.dart';

class ModeloScreen extends StatelessWidget {
  const ModeloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final objeto = ModeloService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listar Modelos'),
      ),
      body: FutureBuilder<List<Modelo>>(future: objeto.listar(), builder: 
      (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        } 
        if (snapshot.hasError){ return const Center(child: Text('Erro ao carregar os modelos'));
        }
        final modelos = snapshot.data!;
        return ListView.builder(
          itemCount: modelos.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                title: Text(modelos[index].nome),
              ),
            );
          }, 
        );
       },
      ),
    );
  }
}
  


