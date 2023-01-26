import 'package:flutter/material.dart';
import 'package:gym_app/domain/exercise.dart';

class ExerciseListOrderView extends StatefulWidget {
  final List<Exercise> exercises;
  final Exercise exerciseSelected;
  const ExerciseListOrderView(
      {Key? key, required this.exercises, required this.exerciseSelected})
      : super(key: key);

  @override
  State<ExerciseListOrderView> createState() => _ExerciseListOrderViewState();
}

class _ExerciseListOrderViewState extends State<ExerciseListOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('esto es una prueba')));
  }
}
