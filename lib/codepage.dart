import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CodeEditorPage extends StatefulWidget {
  @override
  _CodeEditorPageState createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  final TextEditingController _controller = TextEditingController();
  String _output = '';
  String _selectedLanguage = 'java'; // Başlangıçta Java dilini seçili olarak ayarla

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _compileCode() async {
    final clientId = '48e68fae48a771629155b6e169d0e491'; // JDoodle client ID
    final clientSecret = 'fbef623b8f200288bfe90c03b31da755126bf3ae62700620f2d994b78dd8c907'; // JDoodle client secret
    final apiUrl = 'https://api.jdoodle.com/v1/execute';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'clientId': clientId,
        'clientSecret': clientSecret,
        'script': _controller.text,
        'language': _selectedLanguage, // Seçilen dili kullan
        'versionIndex': '0'
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      setState(() {
        _output = responseData['output'];
      });
    } else if (response.statusCode == 403) {
      setState(() {
        _output = 'Error: 403 - Forbidden. Please check your API credentials.';
      });
    } else {
      setState(() {
        _output = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Code Compiler',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Select a Language',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                    });
                  },
                  items: <String>['java', 'c', 'c++', 'python']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toUpperCase()),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your $_selectedLanguage code here',
                labelStyle: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              style: TextStyle(
                fontFamily: 'monospace', // Set the input text font to monospace
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _compileCode,
              child: Text(
                'Show Output',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    _output,
                    style: TextStyle(fontSize: 16.0, fontFamily: 'monospace'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
