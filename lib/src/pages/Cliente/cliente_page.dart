import 'package:clienteapp/src/pages/Cliente/Controller/cliente_controller.dart';
import 'package:clienteapp/src/pages/Cliente/cliente_cadastro_page.dart';
import 'package:clienteapp/src/pages/Cliente/cliente_editar_page.dart';
import 'package:flutter/material.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({Key? key}) : super(key: key);

  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  final controller = ClienteController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.getClientes();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ClienteCadastroPage(
              onSaved: controller.postCliente,
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: controller.getClientes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar os clientes.'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.state.clientes.length,
              itemBuilder: (_, index) {
                final cliente = controller.state.clientes[index];
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(cliente.nome ?? ""),
                    subtitle: Text(cliente.email ?? ""),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ClienteEditarPage(
                            cliente: cliente,
                            onSaved: controller.putCliente,
                            onDelete: controller.deleteCliente,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
