import 'package:my_imc_calc_app/task_model.dart';

class TaskState {
  final List<Task> tasks;
  final double progress;

  TaskState({required this.tasks, required this.progress});

  factory TaskState.initial(List<Task> initialTasks) {
    final completedTasks = initialTasks.where((task) => task.isChecked).length;
    final progress = initialTasks.isEmpty ? 0.0 : completedTasks / initialTasks.length;

    return TaskState(tasks: initialTasks, progress: progress);
  }

  TaskState copyWith({List<Task>? tasks}) {
    final newTasks = tasks ?? this.tasks;
    final completedTasks = newTasks.where((task) => task.isChecked).length;
    final progress = newTasks.isEmpty ? 0.0 : completedTasks / newTasks.length;

    return TaskState(tasks: newTasks, progress: progress);
  }
}
