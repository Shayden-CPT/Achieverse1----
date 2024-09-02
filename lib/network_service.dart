// lib/services/network_service.dart
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final Dio _dio = Dio();
  
  Future<void> fetchDataWithHttp() async {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      print('Data with http: ${response.body}');
    } else {
      print('Failed to load data with http');
    }
  }

  Future<void> fetchDataWithDio() async {
    try {
      final response = await _dio.get('https://api.example.com/data');
      print('Data with dio: ${response.data}');
    } catch (e) {
      print('Failed to load data with dio: $e');
    }
  }
}
