import 'package:clienteapp/src/shared/model/cliente_model.dart';
import 'package:flutter/material.dart';

class ClienteCadastroPage extends StatefulWidget {
  const ClienteCadastroPage({Key? key, this.cliente, required this.onSaved})
      : super(key: key);

  final ClienteModel? cliente;
  final Function(ClienteModel) onSaved;

  @override
  State<ClienteCadastroPage> createState() => _ClienteCadastroPageState();
}

class _ClienteCadastroPageState extends State<ClienteCadastroPage> {
  late TextEditingController _nomeController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    // Inicialize os controladores com os valores existentes, se houverem
    _nomeController = TextEditingController(text: widget.cliente?.nome ?? '');
    _emailController = TextEditingController(text: widget.cliente?.email ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Cliente'),
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
                final novoCliente = ClienteModel(
                  nome: _nomeController.text,
                  email: _emailController.text,
                );

                // Chame a função onSaved passando o novo ClienteModel
                widget.onSaved(novoCliente);
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
