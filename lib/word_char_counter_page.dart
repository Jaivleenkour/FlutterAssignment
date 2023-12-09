import 'package:flutter/material.dart';

class WordCharCounterPage extends StatefulWidget {
  @override
  _WordCharCounterPageState createState() => _WordCharCounterPageState();
}

class _WordCharCounterPageState extends State<WordCharCounterPage> {
  TextEditingController _textEditingController = TextEditingController();
  int wordCount = 0;
  int charCount = 0;

  // update the word and character count 
  void _updateCount() {
    String text = _textEditingController.text;

    // If the text is empty, reset word count to zero
    if (text.isEmpty) {
      setState(() {
        wordCount = 0;
        charCount = 0;
      });
      return;
    }

    List<String> words = text.split(RegExp(r'\s+')); 
    setState(() {
      wordCount = words.length;
      charCount = text.replaceAll(RegExp(r'\s'), '').length; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word and Character Counter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heading
            Text(
              'Word and Character Counter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Text input field for text
            TextField(
              controller: _textEditingController,
              maxLines: 5,
              onChanged: (value) {
                _updateCount();
              },
              decoration: InputDecoration(
                hintText: 'Type here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Display word count
            Text(
              'Word Count: $wordCount',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            // Display character count 
            Text(
              'Character Count: $charCount',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WordCharCounterPage(),
  ));
}
