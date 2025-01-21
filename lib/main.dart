// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// Classe para representar uma tarefa
class Task {
  final String title;
  bool isChecked;

  Task({required this.title, this.isChecked = false});
}

// Provedor para gerenciar a lista de tarefas
final tasksProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

// Gerenciador de estado para as tarefas
class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super(List.generate(6, (index) => Task(title: 'This is a Task ${index + 1}')));

  // Alternar o estado de uma tarefa
  void toggleTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Task(title: state[i].title, isChecked: !state[i].isChecked)
        else
          state[i],
    ];
  }
}

// Provedor para calcular o progresso com base nas tarefas concluídas
final progressProvider = Provider<double>((ref) {
  final tasks = ref.watch(tasksProvider);
  final completedTasks = tasks.where((task) => task.isChecked).length;
  return tasks.isEmpty ? 0.0 : completedTasks / tasks.length;
});

// Aplicativo principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

// Widget principal da página inicial
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Progress(),
          ),
          Expanded(child: TaskList()),
        ],
      ),
    );
  }
}

// Widget para exibir o progresso
class Progress extends ConsumerWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: Text( 'This is your Progress Indicator...', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: progress),
        const SizedBox(height: 10),
        Text('${(progress * 100).toStringAsFixed(1)}% Completed',style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

// Widget para exibir a lista de tarefas
class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          leading: Checkbox(
            value: task.isChecked,
            onChanged: (bool? newValue) {
              ref.read(tasksProvider.notifier).toggleTask(index);
            },
          ),
          title: Text(task.title),
        );
      },
    );
  }
}
