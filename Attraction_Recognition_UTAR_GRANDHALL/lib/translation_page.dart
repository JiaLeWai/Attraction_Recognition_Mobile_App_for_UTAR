import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TranslationPage extends StatefulWidget {
  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  String inputText = '';
  String translatedText = '';
  String inputLanguage = 'auto';
  String outputLanguage = 'en';
  final inputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      setState(() {
        inputText = inputController.text;
      });
    });
  }

  String languageCodeToName(String code) {
    switch (code) {
      case 'auto':
        return 'Auto Detect';
      case 'en':
        return 'English';
      case 'zh':
        return 'Chinese';
      case 'ms':
        return 'Malay';
      default:
        return 'Unknown';
    }
  }

  Future<void> translateText() async {
    if (inputText.isEmpty) return;

    final String apiKey = ''; // INSEERT YOUR API KEY HERE
    final String url =
        'https://translation.googleapis.com/language/translate/v2?key=$apiKey';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'q': inputText,
          'source': inputLanguage == 'auto' ? '' : inputLanguage,
          'target': outputLanguage,
          'format': 'text',
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          translatedText = jsonResponse['data']['translations'][0]['translatedText'];
        });
      } else {
        throw Exception('Failed to load translation');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Translator')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: inputController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Enter text',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      value: inputLanguage,
                      onChanged: (String? newValue) {
                        setState(() {
                          inputLanguage = newValue!;
                        });
                      },
                      items: <String>[
                        'auto',
                        'en',
                        'zh',
                        'ms',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(languageCodeToName(value)),
                        );
                      }).toList(),
                      hint: Text('Input Language'),
                    ),
                    DropdownButton<String>(
                      value: outputLanguage,
                      onChanged: (String? newValue) {
                        setState(() {
                          outputLanguage = newValue!;
                        });
                      },
                      items: <String>[
                        'en',
                        'zh',
                        'ms',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(languageCodeToName(value)),
                        );
                      }).toList(),
                      hint: Text('Output Language'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      translateText();
                    }
                  },
                  child: Text('Translate'),
                ),
                SizedBox(height: 16),
                if (translatedText.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(translatedText),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
