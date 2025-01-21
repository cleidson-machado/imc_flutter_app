import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

// Nova widget MyHomePage
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
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 20),
            child: Expanded(child: Progress()),
          ),
          Expanded(child: TaskList()), // TaskList incorporada aqui
        ],
      ),
    );
  }
}

class Progress extends StatelessWidget{
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('This is your Progress Indicator...', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        LinearProgressIndicator(value: 0.0,),
      ],
    );
  }
}

// Widget TaskList separada
class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<Map<String, dynamic>> _tasks = List.generate(
    6,
    (index) => {'title': 'This is a Task ${index + 1}', 'isChecked': false},
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Checkbox(
            value: _tasks[index]['isChecked'],
            onChanged: (bool? newValue) {
              setState(() {
                _tasks[index]['isChecked'] = newValue!;
              });
            },
          ),
          title: Text(_tasks[index]['title']),
        );
      },
    );
  }
}
