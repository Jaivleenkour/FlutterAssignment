import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DomainInfoPage extends StatefulWidget {
  @override
  _DomainInfoPageState createState() => _DomainInfoPageState();
}

class _DomainInfoPageState extends State<DomainInfoPage> {
  TextEditingController _domainController = TextEditingController();

  Map<String, dynamic>? _ipInfo;

  // Function to fetch domain information from API
  Future<void> _fetchDomainInfo(String domain) async {
    // Make an HTTP request
    final response = await http.get(
      Uri.parse('http://ip-api.com/json/$domain'),
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      // If successful
      setState(() {
        _ipInfo = json.decode(response.body);
      });
    } else {
      // If not successful
      throw Exception('Failed to load domain info');
    }
  }

  // Build method for rendering the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Domain Info Lookup'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text input field for entering the domain
            TextField(
              controller: _domainController,
              decoration: InputDecoration(
                hintText: 'Enter domain (e.g., georgiancollege.ca)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Button to trigger the domain info lookup
            ElevatedButton(
              onPressed: () {
                // Extract the trimmed domain
                final domain = _domainController.text.trim();
                // Check if the domain is not empty
                if (domain.isNotEmpty) {
                  _fetchDomainInfo(domain);
                }
              },
              child: Text('Lookup Domain Info'),
            ),
            SizedBox(height: 16),
            // Display retrieved domain information
            if (_ipInfo != null)
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Domain Info:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Divider(),
                      Text('Country: ${_ipInfo!['country']}'),
                      Text('Region: ${_ipInfo!['regionName']}'),
                      Text('City: ${_ipInfo!['city']}'),
                      Text('Zip Code: ${_ipInfo!['zip']}'),
                      Text('Latitude: ${_ipInfo!['lat']}'),
                      Text('Longitude: ${_ipInfo!['lon']}'),
                      Text('Timezone: ${_ipInfo!['timezone']}'),
                      Text('ISP: ${_ipInfo!['isp']}'),
                      Text('Organization: ${_ipInfo!['org']}'),
                    ],
                  ),
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
    home: DomainInfoPage(),
  ));
}
