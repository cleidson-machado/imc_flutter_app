import 'package:flutter/cupertino.dart';

class HomeContentScreen extends StatelessWidget {
  final String? data;

  const HomeContentScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("Home")),
      child: Center(
        child: Text(data ?? "Nenhum dado recebido"),
      ),
    );
  }
}
