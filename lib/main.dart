import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_view_model.dart'; // Import do ViewModel e outras classes

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

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

class Progress extends ConsumerWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(taskViewModelProvider.select((state) => state.progress));
    final progressPercentage = ref.watch(taskViewModelProvider.select((state) => state.progressPercentage));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'This is your Progress Indicator...',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: progress),
        const SizedBox(height: 8),
        Text(progressPercentage, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}


class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskViewModelProvider.select((state) => state.tasks));

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return CheckboxListTile(
          value: task.isChecked,
          onChanged: (_) => ref.read(taskViewModelProvider.notifier).toggleTask(index),
          title: Text(task.title),
        );
      },
    );
  }
}
