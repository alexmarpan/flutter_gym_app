// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/application/const.dart';

import 'package:gym_app/domain/serie.dart';

class SerieUniqueView extends StatefulWidget {
  final Serie serie;
  final int index;

  const SerieUniqueView({
    Key? key,
    required this.serie,
    required this.index,
  }) : super(key: key);

  @override
  State<SerieUniqueView> createState() => _SerieUniqueViewState();
}

class _SerieUniqueViewState extends State<SerieUniqueView> {
  @override
  Widget build(BuildContext context) {
    return _builderRowSerie(widget.serie);
  }

  Row _builderRowSerie(Serie serie) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      generatePopUpMenuButton(serie),
      generateText(serie),
      generateTextFieldPeso(serie),
      generateTextFieldRepes(serie),
      generateCheckBox(serie)
    ]);
  }

  Expanded generatePopUpMenuButton(Serie serie) {
    return Expanded(
        flex: 0,
        child: PopupMenuButton<String>(
            splashRadius: 20.0,
            tooltip: 'Tipo de serie',
            onSelected: (String value) =>
                onPopUpMenuButtonSelected(serie, value),
            itemBuilder: (context) => opcionserie,
            icon: Text(getTextoMenuButton(serie))));
  }

  String getTextoMenuButton(Serie serie) {
    switch (serie.tipoSerie) {
      case 'C':
      case 'D':
      case 'F':
        return serie.tipoSerie;
      default:
        return (widget.index + 1).toString();
    }
  }

  void onPopUpMenuButtonSelected(Serie serie, String value) {
    serie.tipoSerie = serie.tipoSerie == value ? 'N' : value;
    setState(() {});
  }

  Expanded generateText(Serie serie) {
    return Expanded(
        flex: 1,
        child: Text(
            serie.otrosDatos.pesoAnterior != null &&
                    serie.otrosDatos.repesAnterior != null
                ? '${serie.otrosDatos.pesoAnterior} x ${serie.otrosDatos.repesAnterior}'
                : '-',
            style: const TextStyle(fontSize: 14)));
  }

  Expanded generateTextFieldPeso(Serie serie) {
    return Expanded(
        flex: 2,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(16)),
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: serie.otrosDatos.pesoAnterior != null
                        ? '${serie.otrosDatos.pesoAnterior}'
                        : 'KG'),
                controller: serie.peso != null
                    ? TextEditingController(text: serie.peso.toString())
                    : null,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (String value) {
                  modificarPesoSerie(serie, value != '' ? value : null);
                })));
  }

  void modificarPesoSerie(Serie serie, String? value) {
    serie.peso = value != null ? int.parse(value) : null;
  }

  Expanded generateTextFieldRepes(Serie serie) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: serie.otrosDatos.repesAnterior != null
                    ? '${serie.otrosDatos.repesAnterior}'
                    : 'REPS'),
            controller: serie.repes != null
                ? TextEditingController(text: serie.repes.toString())
                : null,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (String value) {
              modificarRepesSerie(serie, value != '' ? value : null);
            }),
      ),
    );
  }

  void modificarRepesSerie(Serie serie, String? value) {
    serie.repes = value != null ? int.parse(value) : null;
  }

  Expanded generateCheckBox(Serie serie) {
    return Expanded(
        flex: 0,
        child: Checkbox(
            value: serie.check,
            onChanged: (bool? value) => checkSerie(serie, value)));
  }

  checkSerie(Serie serie, bool? value) {
    serie.check = value ?? false;
    setState(() {});
  }
}
