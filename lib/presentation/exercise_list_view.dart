import 'package:flutter/material.dart';
import 'package:gym_app/domain/view_models/exercise_serie_viewmodel.dart';
import 'package:gym_app/presentation/exercise_list_order_view.dart';
import 'package:gym_app/presentation/exercise_unique_view.dart';

class ExerciseListView extends StatefulWidget {
  final List<ExerciseSerieViewModel>? exercises;
  const ExerciseListView({
    Key? key,
    required this.exercises,
  }) : super(key: key);

  @override
  State<ExerciseListView> createState() => _ExerciseListViewState();
}

class _ExerciseListViewState extends State<ExerciseListView> {
  @override
  Widget build(BuildContext context) {
    return generarListaExercises(widget.exercises!);
  }

  ListView generarListaExercises(List<ExerciseSerieViewModel> exercises) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: exercises.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            widgetListExercise(exercises[index]),
            const SizedBox(height: 10)
          ]);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 5));
  }

  ExerciseUniqueView widgetListExercise(ExerciseSerieViewModel exercise) {
    return ExerciseUniqueView(
      exercise: exercise,
      selected: (value) => orderExercises(value),
    );
  }

  void orderExercises(ExerciseSerieViewModel exercise) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => ExerciseListOrderView(
            exercises: widget.exercises!.map((e) => e.exercise).toList(),
            exerciseSelected: exercise.exercise))));
  }
}
