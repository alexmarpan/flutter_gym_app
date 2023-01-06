import 'package:flutter/material.dart';
import 'package:gym_app/presentation/contador_pasos_view.dart';
import 'package:gym_app/presentation/menu_entrenamiento_view.dart';
import 'package:gym_app/shared/custom_page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [goToMenuEntrenamiento(), goToContadorPasos()],
        )));
  }

  TextButton goToMenuEntrenamiento() {
    return TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(CustomPageRoute(child: const MenuEntrenamientoView()));
        },
        child: const Text('Crear nuevo entrenamiento',
            style: TextStyle(fontSize: 26)));
  }

  TextButton goToContadorPasos() {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => const ContadorPasosView())));
        },
        child: const Text('Contador de pasos', style: TextStyle(fontSize: 26)));
  }
}
