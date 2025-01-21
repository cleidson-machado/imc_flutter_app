import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// CLASSE PARA REPRESENTAR UMA TAREFA
class Task {
  final String title;
  bool isChecked;

  Task({required this.title, this.isChecked = false});
}

// LISTA MOCK DE TAREFAS
final List<Task> mockTasks = [
  Task(title: 'This is a Task 1'),
  Task(title: 'This is a Task 2'),
  Task(title: 'This is a Task 3'),
  Task(title: 'This is a Task 4'),
  Task(title: 'This is a Task 5'),
  Task(title: 'This is a Task 6'),
  Task(title: 'This is a Task 7'),
  Task(title: 'This is a Task 8'),
  Task(title: 'This is a Task 10'),
];

// ############################################ REGRAS DE NEGÓCIO: GERENCIAR A LISTA DE TAREFAS ############################################
final tasksProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

// ############################################ GERENCIADOR DE ESTADO DAS TAREFAS ############################################
class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super(mockTasks); // UTILIZANDO A LISTA MOCK

  // ############################################ REGRA DE NEGÓCIO: ALTERAR O ESTADO DE UMA TAREFA ############################################
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

// ############################################ REGRA DE NEGÓCIO: CALCULAR O PROGRESSO COM BASE NAS TAREFAS CONCLUÍDAS ############################################
final progressProvider = Provider<double>((ref) {
  final tasks = ref.watch(tasksProvider);
  final completedTasks = tasks.where((task) => task.isChecked).length;
  return tasks.isEmpty ? 0.0 : completedTasks / tasks.length;
});

// APLICATIVO PRINCIPAL
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

// WIDGET PRINCIPAL DA PÁGINA INICIAL
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

// INDICADOR DE PROGRESSO
class Progress extends ConsumerWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(child: Text('This is your Progress Indicator...', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: progress),
        const SizedBox(height: 8),
        Text('${(progress * 100).toStringAsFixed(1)}% Completed', style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

// LISTA DE TAREFAS
class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return CheckboxListTile(
          value: task.isChecked,
          onChanged: (_) => ref.read(tasksProvider.notifier).toggleTask(index),
          title: Text(task.title),
        );
      },
    );
  }
}
