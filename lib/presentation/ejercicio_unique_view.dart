import 'package:flutter/material.dart';
import 'package:gym_app/domain/ejercicio.dart';
import 'package:gym_app/presentation/serie_list_view.dart';

class EjercicioUniqueView extends StatefulWidget {
  final ValueChanged<Ejercicio> selected;
  final Ejercicio ejercicio;

  const EjercicioUniqueView(
      {Key? key, required this.ejercicio, required this.selected})
      : super(key: key);

  @override
  State<EjercicioUniqueView> createState() => _EjercicioUniqueViewState();
}

class _EjercicioUniqueViewState extends State<EjercicioUniqueView> {
  bool _showSerie = true;

  @override
  Widget build(BuildContext context) {
    return _builderRowEjercicio(widget.ejercicio);
  }

  Column _builderRowEjercicio(Ejercicio ejercicio) {
    List<Widget> children = [
      generateTitulo(ejercicio),
      const SizedBox(height: 10),
      SerieListView(idEjercicio: ejercicio.nombre, visible: _showSerie)
    ];

    return Column(children: children);
  }

  Row generateTitulo(Ejercicio ejercicio) {
    return Row(children: [
      Expanded(
          flex: 25,
          child: TextButton(
              onPressed: () {
                changeShowSerie();
              },
              onLongPress: () => widget.selected(ejercicio),
              style: const ButtonStyle(alignment: Alignment.topLeft),
              child: Text(ejercicio.nombre,
                  style: const TextStyle(fontSize: 24)))),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PopupMenuButton<String>(
              tooltip: 'Opciones ejercicio',
              splashRadius: 20.0,
              itemBuilder: (context) => [
                /**
                  * añadir nota, crear superserie 
                  * cambiar ejercicio
                  * tiempo de descanso, tipo de peso (kg, lb)
                  * eliminar ejercicio 
                  */
                const PopupMenuItem(
                    value: 'cambiar', child: Text('Cambiar ejercicio')),
                const PopupMenuItem(
                    value: 'borrar', child: Text('Borrar ejercicio'))
              ],
            )
          ],
        ),
      )
    ]);
  }

  void changeShowSerie() {
    _showSerie = !_showSerie;
    setState(() {});
  }
}
