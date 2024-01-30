import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:clienteapp/src/shared/model/cliente_model.dart';

class ClienteRepository {
  Future<List<ClienteModel>> getClientes() async {
    try {
      final response = await http.get(
        //Coloque o IP e PORTA da sua máquina
        Uri.parse('http://10.0.2.2:5027/api/Cliente/'),
      );

      if (response.statusCode == 200) {
        final json = response.body;
        final list = jsonDecode(json);
        final clientes = list.map<ClienteModel>((e) {
          return ClienteModel.fromJson(e);
        }).toList();
        return clientes;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> postCliente(ClienteModel cliente) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5027/api/Cliente'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(cliente.toJson()),
      );
    } catch (e) {
      print('Erro durante a requisição: $e');
    }
  }

  Future<void> putCliente(ClienteModel cliente, int id) async {
    try {
      final response = await http.put(
        Uri.parse('http://10.0.2.2:5027/api/Cliente/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(cliente.toJson()),
      );
    } catch (e) {
      print('Erro durante a requisição: $e');
    }
  }

  Future<void> deleteCliente(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('http://10.0.2.2:5027/api/Cliente/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
    } catch (e) {
      print('Erro durante a requisição: $e');
    }
  }
}
