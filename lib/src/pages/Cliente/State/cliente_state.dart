// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clienteapp/src/shared/model/cliente_model.dart';
import 'package:equatable/equatable.dart';

class ClienteState extends Equatable {
  final List<ClienteModel> clientes;
  final bool isLoading = false;

  ClienteState({
    required this.clientes,
  });

  factory ClienteState.initial() {
    return ClienteState(
      clientes: [],
    );
  }

  ClienteState copyWith({
    List<ClienteModel>? clientes,
    bool? isLoading,
  }) {
    return ClienteState(
      clientes: clientes ?? this.clientes,
    );
  }

  @override
  List<Object?> get props => [clientes, isLoading];
}
