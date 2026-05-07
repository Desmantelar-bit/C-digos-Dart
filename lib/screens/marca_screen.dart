import 'package:agriapp/models/marca.dart';
import 'package:agriapp/services/marca_service.dart';
import 'package:flutter/material.dart';

class MarcaScreen extends StatelessWidget {
  const MarcaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final objeto = MarcaService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listar Marcas'),
      ),
      body: FutureBuilder<List<Marca>>(future: objeto.listar(), builder: 
      (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        } 
        if (snapshot.hasError){ return const Center(child: Text('Erro ao carregar as marcas'));
        }
        final marcas = snapshot.data!;
        return ListView.builder(
          itemCount: marcas.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                title: Text(marcas[index].nome),
              ),
            );
          }, 
        );
       },
      ),
    );
  }
}
  


