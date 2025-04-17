import 'package:flutter/material.dart';

class KelolaSiswaScreen extends StatelessWidget {
  const KelolaSiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelola Data Siswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Tambah Siswa"),
              onPressed: () {
                // TODO: Navigasi ke form tambah
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text("Import dari Excel"),
              onPressed: () {
                // TODO: Import excel
              },
            ),
            const SizedBox(height: 24),
            const Expanded(
              child: Center(
                child: Text("Daftar siswa akan ditampilkan di sini"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
