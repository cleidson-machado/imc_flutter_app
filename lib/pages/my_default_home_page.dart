// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//### Constants-Variables
const heightBottomPageContainer = 90.0;
const colorForActiveDefaultContainerCard = Color(0xFF9E9E9E);
const TextStyle textStyleTagTitleName = TextStyle(fontSize: 20.0, color: Colors.black);

class MyDefaultHomePage extends StatefulWidget {
  const MyDefaultHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyDefaultHomePage> createState() => _MyDefaultHomePageState();
}

class _MyDefaultHomePageState extends State<MyDefaultHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 2.5,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DefaultCardContainer(
                      cardColor: colorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.mars, size: 95.0),
                          SizedBox(height: 15.0),
                          Text('MASCULINO', style: textStyleTagTitleName),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DefaultCardContainer(
                      cardColor: colorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.venus, size: 95.0),
                          SizedBox(height: 15.0),
                          Text('FEMININO', style: textStyleTagTitleName),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: DefaultCardContainer(
                cardColor: colorForActiveDefaultContainerCard,
                cardChildContent: Column(
                  children: [
                    Text('Content ToDo...'),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DefaultCardContainer(
                      cardColor: colorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        children: [
                          Text('Content ToDo...'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DefaultCardContainer(
                      cardColor: colorForActiveDefaultContainerCard,
                      cardChildContent: Column(
                        children: [
                          Text('Content ToDo...'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                margin: const EdgeInsets.only(top: 10.0),
                height: heightBottomPageContainer),
          ],
        ));
  }
}

class DefaultCardContainer extends StatelessWidget {
  const DefaultCardContainer(
      {required this.cardColor, required this.cardChildContent});

  final Color cardColor;
  final Widget cardChildContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChildContent,
    );
  }
}
