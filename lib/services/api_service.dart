import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<http.Response> uploadContacts(List<Map<String, dynamic>> contacts) async {
    final url = Uri.parse('$baseUrl/contacts');
    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: contacts,
    );
  }
}
