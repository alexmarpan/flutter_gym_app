import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym_app/domain/view_models/exercise_serie_viewmodel.dart';
import 'package:gym_app/presentation/step_counter_view.dart';
import 'package:gym_app/presentation/workout_menu_view.dart';
import 'package:gym_app/shared/custom_page_route.dart';
import 'package:gym_app/shared/utils.dart';

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
  void initState() {
    super.initState();
    seeFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [goToMenuWorkout()],
        )));
  }

  TextButton goToMenuWorkout() {
    return TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(CustomPageRoute(child: const MenuWorkoutView()));
        },
        child:
            const Text('Create new workout', style: TextStyle(fontSize: 26)));
  }

  TextButton goToContadorPasos() {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => const StepCounterView())));
        },
        child: const Text('Step counter', style: TextStyle(fontSize: 26)));
  }

  void seeFiles() async {
    var files = await readFiles();
    for (var element in files) {
      if (element is File && element.path.endsWith('_train.json')) {
        var prueba = ExerciseSerieViewModel.fromJson(
            json.decode(element.readAsStringSync()));
        print(prueba);
      }
    }
  }
}
