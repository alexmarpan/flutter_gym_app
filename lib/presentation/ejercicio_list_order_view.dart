import 'package:flutter/material.dart';
import 'package:gym_app/domain/ejercicio.dart';

class EjercicioListOrderView extends StatefulWidget {
  final List<Ejercicio> ejercicios;
  final Ejercicio ejercicioSelected;
  const EjercicioListOrderView(
      {Key? key, required this.ejercicios, required this.ejercicioSelected})
      : super(key: key);

  @override
  State<EjercicioListOrderView> createState() => _EjercicioListOrderViewState();
}

class _EjercicioListOrderViewState extends State<EjercicioListOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('esto es una prueba')));
  }
}
