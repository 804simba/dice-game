import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    );
  }
}

class App extends StatelessWidget {
  final String data;
  const App(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 200,);
  }
}
