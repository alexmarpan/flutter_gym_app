import 'package:flutter/material.dart';
import 'package:gym_app/domain/ejercicio.dart';
import 'package:gym_app/presentation/ejercicio_list_view.dart';

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
  late Future<List<Ejercicio>?> _ejercicios;

  @override
  void initState() {
    super.initState();
    _ejercicios = getEjercicios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: _ejercicios,
            builder: ((BuildContext context, AsyncSnapshot snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(child: Text('Cargando ejercicio ...'));
              }

              if (snap.hasError || !snap.hasData) {
                return const Center(child: Text('No hay datos'));
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    EjercicioListView(ejercicios: snap.data),
                    addEjercicio(snap.data)
                  ],
                ),
              );
            })));
  }

  TextButton addEjercicio(List<Ejercicio> ejercicios) {
    return TextButton(
        onPressed: () {
          generateEjercicio(ejercicios);
        },
        child: const Text('Añadir ejercicio', style: TextStyle(fontSize: 26)));
  }

  void generateEjercicio(List<Ejercicio> ejercicios) {
    ejercicios.add(Ejercicio.createTestEjercicio('Press banca'));
    setState(() {});
  }
}

Future<List<Ejercicio>?> getEjercicios() async {
  List<Ejercicio> l = [];

  l.add(Ejercicio.createTestEjercicio('Bicep curl'));

  return l.isNotEmpty ? l : null;
}
