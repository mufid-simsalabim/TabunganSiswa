import 'package:flutter/material.dart';

class RiwayatTransaksiScreen extends StatelessWidget {
  const RiwayatTransaksiScreen({super.key});

  // Dummy data untuk ditampilkan
  final List<Map<String, dynamic>> transaksi = const [
    {
      'tipe': 'Masuk',
      'jumlah': 20000,
      'waktu': '09:00',
      'nama': 'Rudi Hartono',
      'nisn': '1209876543',
    },
    {
      'tipe': 'Tarik',
      'jumlah': 15000,
      'waktu': '10:30',
      'nama': 'Sari Wulandari',
      'nisn': '1209876544',
    },
    {
      'tipe': 'Masuk',
      'jumlah': 30000,
      'waktu': '12:15',
      'nama': 'Doni Saputra',
      'nisn': '1209876545',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: transaksi.length,
          itemBuilder: (context, index) {
            final trx = transaksi[index];
            return Card(
              color: Colors.white,
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(
                  trx['tipe'] == 'Masuk'
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: trx['tipe'] == 'Masuk' ? Colors.green : Colors.red,
                ),
                title: Text(
                  '${trx['nama']} (${trx['nisn']})',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${trx['tipe']} - Rp${trx['jumlah']}\nWaktu: ${trx['waktu']}',
                ),
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
