import 'package:agriapp/models/marca.dart';
import 'package:agriapp/services/marca_service.dart';
import 'package:flutter/material.dart';

class MarcaFormScreen extends StatefulWidget {
  final Marca? marca;
  const MarcaFormScreen({super.key, this.marca});

  @override
  State<MarcaFormScreen> createState() => _MarcaFormScreenState();
}

class _MarcaFormScreenState extends State<MarcaFormScreen> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.marca != null) {
      controller.text = widget.marca!.nome;
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
            final m = Marca(nome: controller.text);
            
            if (widget.marca == null) {
              MarcaService().cadastrar(m);
            }else{
              MarcaService().editar(widget.marca!.id!, m);
            }
            
            Navigator.pop(context);
          }, child: const Text('Cadastrar'),
        )
      ],
    );
  }
}