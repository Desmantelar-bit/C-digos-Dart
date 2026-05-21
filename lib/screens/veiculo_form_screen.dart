import 'package:agriapp/widgets/meu_dropdown.dart';
import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../models/marca.dart';
import '../models/modelo.dart';
import '../services/veiculo_service.dart';
import '../services/marca_service.dart';
import '../services/modelo_service.dart';


class VeiculoFormScreen extends StatefulWidget {
  final Veiculo? veiculo;
  const VeiculoFormScreen({super.key, this.veiculo});

  @override
  State<VeiculoFormScreen> createState() => _VeiculoFormScreenState();
}

class _VeiculoFormScreenState extends State<VeiculoFormScreen> {
  final descCtrl = TextEditingController();
  final anoCtrl = TextEditingController();
  final horimetroCtrl = TextEditingController();

  int? marcaId;
  int? modeloId;
  List<Marca> marcas = [];
  List<Modelo> modelos = [];

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  _carregarDados() async {
    final m = await MarcaService().listar();
    final mod = await ModeloService().listar();
    setState(() {
      marcas = m;
      modelos = mod;
      if (widget.veiculo != null) {
        descCtrl.text = widget.veiculo!.descricao;
        anoCtrl.text = widget.veiculo!.ano.toString();
        horimetroCtrl.text = widget.veiculo!.horimetro.toString();
        marcaId = widget.veiculo!.marcaId;
        modeloId = widget.veiculo!.modeloId;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dados do Veículo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _campo(descCtrl, "Descrição"),
            
            // Usando o componente de Dropdown
            MeuDropdown(
              label: "Marca",
              value: marcaId,
              items: marcas,
              onChanged: (val) => setState(() => marcaId = val),
            ),
            
            MeuDropdown(
              label: "Modelo",
              value: modeloId,
              items: modelos,
              onChanged: (val) => setState(() => modeloId = val),
            ),

            _campo(anoCtrl, "Ano", numerico: true),
            _campo(horimetroCtrl, "Horímetro / KM", numerico: true),
            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvar,
              child: const Text("SALVAR VEÍCULO"),
            )
          ],
        ),
      ),
    );
  }

  void _salvar() async {
    final v = Veiculo(
      descricao: descCtrl.text,
      marcaId: marcaId ?? 0,
      modeloId: modeloId ?? 0,
      ano: int.tryParse(anoCtrl.text) ?? 0,
      horimetro: int.tryParse(horimetroCtrl.text) ?? 0,
    );

    if (widget.veiculo == null) await VeiculoService().cadastrar(v);
    else await VeiculoService().editar(widget.veiculo!.id!, v);
    
    Navigator.pop(context);
  }

  Widget _campo(controller, label, {bool numerico = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: numerico ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }
}