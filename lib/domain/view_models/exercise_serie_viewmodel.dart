import 'package:gym_app/domain/exercise.dart';
import 'package:gym_app/domain/serie.dart';

class ExerciseSerieViewModel {
  Exercise exercise;
  List<Serie> series;

  ExerciseSerieViewModel({required this.exercise, required this.series});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exercise'] = exercise;
    data['series'] = series.map((e) => e.toJson()).toList();
    return data;
  }

  static fromJson(Map<String, dynamic> json) {
    return ExerciseSerieViewModel(
        exercise: Exercise.fromJson(json['exercise']),
        series: List<Serie>.from(json['series'].map((x) => Serie.fromJson(x))));
  }
}
