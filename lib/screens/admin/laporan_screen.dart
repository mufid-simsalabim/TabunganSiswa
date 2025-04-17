import 'package:flutter/material.dart';

class LaporanScreen extends StatelessWidget {
  const LaporanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Laporan Transaksi")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Export laporan harian ke Word/Excel
              },
              child: const Text("Laporan Harian"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Export semua laporan
              },
              child: const Text("Laporan Keseluruhan"),
            ),
          ],
        ),
      ),
    );
  }
}
