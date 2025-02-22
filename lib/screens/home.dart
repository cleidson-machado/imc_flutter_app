// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import '../widgets/buttons.dart';
import '../widgets/text_fields.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Home"),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(placeholder: "Enter your name", controller: _controller),
              const SizedBox(height: 16),
              AppButton(
                text: "Submit",
                onPressed: () {
                  print("Button Pressed: ${_controller.text}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
