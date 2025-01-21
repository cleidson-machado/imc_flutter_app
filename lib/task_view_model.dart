import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_imc_calc_app/task_state.dart';

import 'mock_tasks.dart';

final taskViewModelProvider = StateNotifierProvider<TaskViewModel, TaskState>((ref) {
  return TaskViewModel();
});

class TaskViewModel extends StateNotifier<TaskState> {
  
  TaskViewModel() : super(TaskState.initial(mockTasks));

  void toggleTask(int index) {
    final updatedTasks = [
      for (int i = 0; i < state.tasks.length; i++)
        if (i == index)
          state.tasks[i].copyWith(isChecked: !state.tasks[i].isChecked)
        else
          state.tasks[i],
    ];
    state = state.copyWith(tasks: updatedTasks);
  }

}
