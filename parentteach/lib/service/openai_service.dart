import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getSolution(String query) async {
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/completions'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer your-openai-api-key',
    },
    body: json.encode({
      'model': 'text-davinci-003',
      'prompt': query,
      'max_tokens': 150,
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['choices'][0]['text'];
  } else {
    throw Exception('Failed to load solution');
  }
}
