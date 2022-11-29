import 'package:flutter/material.dart';

class SubmissionFormScreen extends StatelessWidget {
  const SubmissionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submission Form'),
      ),
      body: const Center(
        child: Text('Submission Form Screen'),
        ),
    );
  }
}