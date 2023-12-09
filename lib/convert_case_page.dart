import 'package:flutter/material.dart';

class ConvertCasePage extends StatefulWidget {
  @override
  _ConvertCasePageState createState() => _ConvertCasePageState();
}

class _ConvertCasePageState extends State<ConvertCasePage> {
  TextEditingController _textEditingController = TextEditingController();
  String _convertedText = '';

  // Function to handle text conversion based on the selected type
  void _convertText(String conversionType) {
    String inputText = _textEditingController.text;

    setState(() {
      // Switch case to determine the conversion type and apply the transformation
      switch (conversionType) {
        case 'lower case':
          _convertedText = inputText.toLowerCase();
          break;
        case 'UPPER CASE':
          _convertedText = inputText.toUpperCase();
          break;
        case 'Capitalized Case':
          _convertedText = _capitalizeEachWord(inputText);
          break;
        default:
          _convertedText = inputText;
      }
    });
  }

  // Function to capitalize the first letter of each word in a given text
  String _capitalizeEachWord(String text) {
    return text.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      } else {
        return '';
      }
    }).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert Case'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text input field for entering text
            TextField(
              controller: _textEditingController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter text here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Row of buttons for different conversion types
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var conversionType in [
                  'lower case',
                  'UPPER CASE',
                  'Capitalized Case'
                ])
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    onPressed: () => _convertText(conversionType),
                    child: Text(conversionType,
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
              ],
            ),
            SizedBox(height: 16),
            // Display the converted text heading
            Text(
              'Converted Text:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            // Container to display the converted text with a border
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Text(
                  _convertedText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
