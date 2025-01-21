import 'package:my_imc_calc_app/task_model.dart';

class TaskState {
  final List<Task> tasks;
  final double progress;
  final bool halfWayMessageShown;
  final bool endWayMessageShown;

  TaskState({
    required this.tasks,
    required this.progress,
    this.halfWayMessageShown = false,
    this.endWayMessageShown = false,
  });

  factory TaskState.initial(List<Task> initialTasks) {
    final completedTasks = initialTasks.where((task) => task.isChecked).length;
    final progress = initialTasks.isEmpty ? 0.0 : completedTasks / initialTasks.length;

    return TaskState(tasks: initialTasks, progress: progress);
  }

  TaskState copyWith({
    List<Task>? tasks,
    double? progress,
    bool? halfWayMessageShown,
    bool? endWayMessageShown,
  }) {
    final newTasks = tasks ?? this.tasks;
    final completedTasks = newTasks.where((task) => task.isChecked).length;
    final calculatedProgress = newTasks.isEmpty ? 0.0 : completedTasks / newTasks.length;

    return TaskState(
      tasks: newTasks,
      progress: calculatedProgress,
      halfWayMessageShown: halfWayMessageShown ?? this.halfWayMessageShown,
      endWayMessageShown: endWayMessageShown ?? this.endWayMessageShown,
    );
  }

  String get progressPercentage => '${(progress * 100).toStringAsFixed(1)}% Completed';
}
