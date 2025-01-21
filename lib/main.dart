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

    bool halfWayMessageTag = false;
    bool endWayMessageTag = false;

    final progressState = ref.watch(taskViewModelProvider);
    final progressPercentage = progressState.progressPercentage;
    final progress = progressState.progress;

    // CHECK IF PROGRESS IS APPROXIMATELY 50%
    if (progress > 0.49 && progress < 0.56 && !halfWayMessageTag) {
      halfWayMessageTag = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Never Give Up! You have $progressPercentage of the tasks!')),
        );
      });
    }

    // CHECK IF PROGRESS IS 100%
    if (progress == 1.0 && !endWayMessageTag) {
      endWayMessageTag = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Congratulations! You have $progressPercentage of the tasks!')),
        );
      });
    }

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
    final tasks =
        ref.watch(taskViewModelProvider.select((state) => state.tasks));

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return CheckboxListTile(
          value: task.isChecked,
          onChanged: (_) =>
              ref.read(taskViewModelProvider.notifier).toggleTask(index),
          title: Text(task.title),
        );
      },
    );
  }
}
