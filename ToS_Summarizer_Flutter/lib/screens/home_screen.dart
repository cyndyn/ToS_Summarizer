import 'package:flutter/material.dart';
import 'package:sfu_flutter/requests.dart';
import 'package:sfu_flutter/screens/results_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> keywords = [
    'privacy',
    'copyright',
    'liability',
    'security'
  ];

  String _tosText = '';
  String _selectedKeyword;

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedKeyword = keywords.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summarized For U'),
      ),
      body: (_loading) ? _spinner() : _getHomePage(),
    );
  }

  Widget _spinner() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getHomePage() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'TOS Summary',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Keyword'),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: DropdownButton(
                    value: _selectedKeyword,
                    items:
                        keywords.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedKeyword = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter the terms of service',
                ),
                onChanged: (value) => _tosText = value,
              ),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  _loading = true;
                });
                final response =
                    await Requests.upload(_tosText, _selectedKeyword);
                setState(() {
                  _loading = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(response),
                  ),
                );
              },
              child: Text(
                'Send',
                style: TextStyle(
                  fontSize: 28.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
