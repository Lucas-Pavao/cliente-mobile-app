import 'package:clienteapp/src/pages/Cliente/State/cliente_state.dart';
import 'package:clienteapp/src/shared/Repository/cliente_repository.dart';
import 'package:clienteapp/src/shared/model/cliente_model.dart';
import 'package:flutter/material.dart';

class ClienteController extends ValueNotifier<ClienteState> {
  ClienteController() : super(ClienteState.initial());
  var state = ClienteState.initial();
  final repository = ClienteRepository();

  getClientes() async {
    state = state.copyWith(isLoading: true);
    final clientes = await repository.getClientes();
    state = state.copyWith(clientes: clientes, isLoading: false);
  }

  Future<void> postCliente(ClienteModel cliente) async {
    state = state.copyWith(isLoading: true);

    // Aguarde a conclusão da requisição antes de prosseguir
    await repository.postCliente(cliente);

    // Atualize a lista de clientes apenas após o sucesso da requisição
    final clientes = await repository.getClientes();
    state = state.copyWith(clientes: clientes, isLoading: false);
  }

  Future<void> putCliente(ClienteModel cliente) async {
    state = state.copyWith(isLoading: true);

    // Aguarde a conclusão da requisição antes de prosseguir
    await repository.putCliente(cliente, cliente.id);

    // Atualize a lista de clientes apenas após o sucesso da requisição
    final clientes = await repository.getClientes();
    state = state.copyWith(clientes: clientes, isLoading: false);
  }

  Future<void> deleteCliente(ClienteModel cliente) async {
    state = state.copyWith(isLoading: true);

    // Aguarde a conclusão da requisição antes de prosseguir
    await repository.deleteCliente(cliente.id);

    // Atualize a lista de clientes apenas após o sucesso da requisição
    final clientes = await repository.getClientes();
    state = state.copyWith(clientes: clientes, isLoading: false);
  }
}
