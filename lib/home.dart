import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:diu_result/api.dart';
import 'package:diu_result/model.dart';
import 'package:diu_result/studentInfo_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _semesterIdController = TextEditingController();

  final ApiService _apiService = ApiService();
  List<ResultModel> _results = [];
  studentInfo? _student;
  bool _isLoading = false;
  String? _error;

  void _fetchResults() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _results = [];
      _student = null;
    });

    try {
      final studentId = _studentIdController.text.trim();
      final semesterId = _semesterIdController.text.trim();

      final student = await _apiService.fetchStudentInfo(studentId: studentId);
      final results = await _apiService.fetchResults(
        studentId: studentId,
        semesterId: semesterId,
      );

      setState(() {
        _student = student;
        _results = results;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildStudentInfo() {
    if (_student == null) return const SizedBox.shrink();

    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 179, 244, 252),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${_student!.studentName}",
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            Text("Student ID: ${_student!.studentId}",style: TextStyle(fontSize: 17),),
            Text("Department: ${_student!.departmentName}"),
            Text("CGPA: ${_results[0].cgpa}",style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 205, 7, 255),fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }

  Widget _buildResultsList() {
    if (_results.isEmpty) {
      return const Center(child: Text("No results found."));
    }

    return ListView.builder(
      itemCount: _results.length,
      itemBuilder: (context, index) {
        final result = _results[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: ListTile(
            title: Text("${result.customCourseId} - ${result.courseTitle}"),
            subtitle: Text(
              "Grade: ${result.gradeLetter}, Point: ${result.pointEquivalent}, Credit: ${result.totalCredit}",
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DIU Result Viewer")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _studentIdController,
              decoration: const InputDecoration(labelText: "Student ID"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _semesterIdController,
              decoration: const InputDecoration(labelText: "Semester ID"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isLoading ? null : _fetchResults,
              child: const Text("Get Results"),
            ),
            const SizedBox(height: 20),
            if (_isLoading) const CircularProgressIndicator(),
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            if (!_isLoading && _error == null && _student != null)
              _buildStudentInfo(),
            if (!_isLoading && _error == null && _results.isNotEmpty)
              Expanded(child: _buildResultsList()),
          ],
        ),
      ),
    );
  }
}
