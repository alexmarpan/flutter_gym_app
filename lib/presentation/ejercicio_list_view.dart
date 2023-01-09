import 'package:flutter/material.dart';
import 'package:gym_app/domain/view_models/ejercicio_serie_viewmodel.dart';
import 'package:gym_app/presentation/ejercicio_list_order_view.dart';
import 'package:gym_app/presentation/ejercicio_unique_view.dart';

class EjercicioListView extends StatefulWidget {
  final List<EjercicioSerieViewModel>? ejercicios;
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

  ListView generarListaEjercicios(List<EjercicioSerieViewModel> ejercicios) {
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

  EjercicioUniqueView widgetListEjercicio(EjercicioSerieViewModel ejercicio) {
    return EjercicioUniqueView(
      ejercicio: ejercicio,
      selected: (value) => orderEjercicios(value),
    );
  }

  void orderEjercicios(EjercicioSerieViewModel ejercicio) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => EjercicioListOrderView(
            ejercicios: widget.ejercicios!.map((e) => e.ejercicio).toList(),
            ejercicioSelected: ejercicio.ejercicio))));
  }
}
