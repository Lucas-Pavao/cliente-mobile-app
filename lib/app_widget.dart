import 'package:clienteapp/src/pages/Cliente/cliente_page.dart';
import 'package:clienteapp/src/shared/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lighttheme,
      darkTheme: darktheme,
      title: 'Cliente',
      routes: {
        '/cliente': (context) => const ClientePage(),
      },
      home: const ClientePage(),
    );
  }
}
