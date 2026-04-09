import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/marca.dart';

class MarcaService{

  final String baseUrl = 'http://localhost:8080/api/marcas';

  Future<List<Marca>> listar() async {
    final resposta = await http.get(Uri.parse(baseUrl));
    final List listaJson = jsonDecode(resposta.body);
    return listaJson.map((item) => Marca.fromJson(item)).toList();
  }

  Future<void> cadastrar(Marca marca) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(marca.toJson()),
    );
  }


}