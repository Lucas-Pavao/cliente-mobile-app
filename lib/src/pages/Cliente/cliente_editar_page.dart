import 'package:clienteapp/src/shared/model/cliente_model.dart';
import 'package:flutter/material.dart';

class ClienteEditarPage extends StatefulWidget {
  const ClienteEditarPage({
    Key? key,
    required this.cliente,
    required this.onSaved,
    required this.onDelete,
  }) : super(key: key);

  final ClienteModel cliente;
  final Function(ClienteModel) onSaved;
  final Function(ClienteModel) onDelete;

  @override
  State<ClienteEditarPage> createState() => _ClienteEdicaoPageState();
}

class _ClienteEdicaoPageState extends State<ClienteEditarPage> {
  late TextEditingController _nomeController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    // Inicialize os controladores com os valores existentes do cliente
    _nomeController = TextEditingController(text: widget.cliente.nome);
    _emailController = TextEditingController(text: widget.cliente.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de Cliente'),
        actions: [
          IconButton(
              onPressed: () => {widget.onDelete, Navigator.of(context).pop()},
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Crie um novo objeto ClienteModel com os valores dos TextFormField
                final clienteAtualizado = ClienteModel(
                  nome: _nomeController.text,
                  email: _emailController.text,
                );

                // Chame a função onSaved passando o ClienteModel atualizado
                widget.onSaved(clienteAtualizado);
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
