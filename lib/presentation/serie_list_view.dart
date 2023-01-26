import 'package:flutter/material.dart';
import 'package:gym_app/domain/serie.dart';
import 'package:gym_app/domain/view_models/exercise_serie_viewmodel.dart';
import 'package:gym_app/presentation/serie_unique_view.dart';

class SerieListView extends StatefulWidget {
  final ExerciseSerieViewModel exercise;
  final bool visible;
  const SerieListView({Key? key, required this.exercise, required this.visible})
      : super(key: key);

  @override
  State<SerieListView> createState() => _SerieListViewState();
}

class _SerieListViewState extends State<SerieListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _builderListSerie();
  }

  Column _builderListSerie() {
    /*return FutureBuilder(
        future: _series,
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (!widget.visible) {
            return const SizedBox.shrink();
          }

          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Cargando series ...'));
          }

          if (snap.hasError || !snap.hasData) {
            return const Center(child: Text('No hay datos'));
          }*/

    return Column(children: [
      generarListaSeries(widget.exercise.series),
      addSerie(widget.exercise.series)
    ]);
    // });
  }

  ListView generarListaSeries(List<Serie> series) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        itemCount: series.length,
        itemBuilder: (BuildContext context, int index) {
          return widgetListSerie(series, index);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 5));
  }

  Dismissible widgetListSerie(List<Serie> series, int index) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_forever,
          color: Colors.white,
          size: 40,
        ),
      ),
      onDismissed: ((dismiss) {
        deleteSerie(series, series[index]);
      }),
      child: SerieUniqueView(serie: series[index], index: index),
    );
  }

  TextButton addSerie(List<Serie> series) {
    return TextButton(
        onPressed: () {
          generateSerie(series);
        },
        child: const Text('Añadir serie', style: TextStyle(fontSize: 20)));
  }

  generateSerie(List<Serie> series) {
    series.add(Serie.createTestSerie(series.length));
    setState(() {});
  }

  void deleteSerie(List<Serie> series, Serie serie) {
    series.remove(serie);
    setState(() {});
  }
}

Future<List<Serie>?> getSeries() async {
  List<Serie> l = [];

  for (int i = 0; i < 2; i++) {
    l.add(Serie.createTestSerie(i));
  }

  return l.isNotEmpty ? l : null;
}
