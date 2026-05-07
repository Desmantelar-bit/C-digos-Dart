import 'package:agriapp/models/modelo.dart';
import 'package:agriapp/services/modelo_service.dart';
import 'package:flutter/material.dart';

class ModeloFormScreen extends StatefulWidget {
  final Modelo? modelo;
  const ModeloFormScreen({super.key, this.modelo});

  @override
  State<ModeloFormScreen> createState() => _ModeloFormScreenState();
}

class _ModeloFormScreenState extends State<ModeloFormScreen> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.modelo != null) {
      controller.text = widget.modelo!.nome;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Digite a Marca'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async{
            final m = Modelo(nome: controller.text);
            
            if (widget.modelo == null) {
              ModeloService().cadastrar(m);
            }else{
              ModeloService().editar(widget.modelo!.id!, m);
            }
            
            Navigator.pop(context);
          }, child: const Text('Cadastrar'),
        )
      ],
    );
  }
}