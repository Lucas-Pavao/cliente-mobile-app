import 'package:clienteapp/src/shared/Repository/cliente_repository.dart';
import 'package:clienteapp/src/shared/model/cliente_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Deve retornar uma lista de cliente", () {
    final repository = ClienteRepository();
    final Future<List<ClienteModel>> clientes = repository.getClientes();
    expect(clientes, isA<Future<List<ClienteModel>>>());
  });
}
