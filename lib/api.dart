import 'package:dio/dio.dart';
import 'package:diu_result/model.dart';
import 'package:diu_result/studentInfo_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<ResultModel>> fetchResults({
    required String studentId,
    required String semesterId,
  }) async {
    final String url ='https://diurecords.vercel.app/api/result?grecaptcha=&semesterId=$semesterId&studentId=$studentId';
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => ResultModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load results');
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
  Future<studentInfo> fetchStudentInfo({
    required String studentId,
  }) async {
    final String url = 'https://diurecords.vercel.app/api/result/studentInfo?studentId=$studentId';
    
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return studentInfo.fromJson(response.data);
      } else {
        throw Exception('Failed to load student info');
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
}
