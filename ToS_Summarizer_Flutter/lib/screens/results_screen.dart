import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String _result;

  ResultScreen(this._result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(_result),
        ],
      ),
    );
  }
}
