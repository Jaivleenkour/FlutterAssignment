// Import necessary packages and pages
import 'package:flutter/material.dart';
import 'convert_case_page.dart';
import 'domain_info_page.dart';
import 'word_char_counter_page.dart';

// Entry point of the application
void main() {
  runApp(MyApp());
}

// Main application class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toolbox App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GreetingPage(), // Initial page to be displayed
    );
  }
}

// Greeting page class
class GreetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold provides basic visual structure for the page
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Flutters World!'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Hello, User!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Image.asset(
                'assets/hero.jpg',
                height: 250,
                width: 600,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Explore the tools below to make your life easier!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // navigation to ConvertCasePage
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConvertCasePage()),
                  );
                },
                child: Text('Convert Case',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //  navigation to WordCharCounterPage
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WordCharCounterPage()),
                  );
                },
                child: Text('Word and Character Counter',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // navigation to DomainInfoPage
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DomainInfoPage()),
                  );
                },
                child: Text('Domain Info Lookup',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
