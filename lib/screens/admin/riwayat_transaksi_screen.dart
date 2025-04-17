import 'package:flutter/material.dart';

class RiwayatTransaksiScreen extends StatelessWidget {
  const RiwayatTransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riwayat Transaksi")),
      body: ListView.builder(
        itemCount: 5, // ganti dengan jumlah riwayat sebenarnya
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text("Nama Siswa"),
            subtitle: const Text("Jenis: Masuk / Tarik\nTanggal: 2025-04-15"),
            trailing: const Text("Rp 20.000"),
          );
        },
      ),
    );
  }
}
