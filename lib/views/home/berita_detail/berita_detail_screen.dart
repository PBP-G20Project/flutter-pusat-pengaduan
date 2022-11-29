import 'package:flutter/material.dart';

class BeritaDetailScreen extends StatelessWidget {
  const BeritaDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Detail'),
      ),
      body: const Center(
        child: Text('Berita Detail'),
      ),
    );
  }
}