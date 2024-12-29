import 'package:flutter/material.dart';

class TabPageExampleA extends StatefulWidget {
  const TabPageExampleA({super.key, required this.title});

  final String title;

  @override
  State<TabPageExampleA> createState() => _TabPageExampleAState();
}

class _TabPageExampleAState extends State<TabPageExampleA> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 2.5,
          title: Text(widget.title),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Tab 01',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Tab 02',
                icon: Icon(Icons.star),
              ),
              Tab(
                text: 'Tab 03',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Center(child: Text('Tab 01 - The CONTENT Is On This Page'),),
          Center(child: Text('Tab 02 - The CONTENT Is On This Page'),),
          Center(child: Text('Tab 03 - The CONTENT Is On This Page'),),
        ]),
      ),
    );
  }
}
