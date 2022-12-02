// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gym_app/domain/ejercicio.dart';
import 'package:gym_app/presentation/ejercicio_list_order_view.dart';
import 'package:gym_app/presentation/ejercicio_unique_view.dart';

class EjercicioListView extends StatefulWidget {
  final List<Ejercicio>? ejercicios;
  const EjercicioListView({
    Key? key,
    required this.ejercicios,
  }) : super(key: key);

  @override
  State<EjercicioListView> createState() => _EjercicioListViewState();
}

class _EjercicioListViewState extends State<EjercicioListView> {
  @override
  Widget build(BuildContext context) {
    return generarListaEjercicios(widget.ejercicios!);
  }

  ListView generarListaEjercicios(List<Ejercicio> ejercicios) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: ejercicios.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            widgetListEjercicio(ejercicios[index]),
            const SizedBox(height: 10)
          ]);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 5));
  }

  EjercicioUniqueView widgetListEjercicio(Ejercicio ejercicio) {
    return EjercicioUniqueView(
      ejercicio: ejercicio,
      selected: (value) => orderEjercicios(value),
    );
  }

  void orderEjercicios(Ejercicio ejercicio) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => EjercicioListOrderView(
            ejercicios: widget.ejercicios!, ejercicioSelected: ejercicio))));
  }
}
