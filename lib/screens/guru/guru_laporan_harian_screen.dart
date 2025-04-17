import 'package:flutter/material.dart';

class GuruLaporanHarianScreen extends StatelessWidget {
  const GuruLaporanHarianScreen({super.key});

  // Dummy data transaksi
  final List<Map<String, dynamic>> transaksiHariIni = const [
    {
      'tipe': 'Masuk',
      'jumlah': 50000,
      'waktu': '08:30',
      'nama': 'Andi Wijaya',
      'nisn': '1234567890',
    },
    {
      'tipe': 'Tarik',
      'jumlah': 20000,
      'waktu': '10:15',
      'nama': 'Budi Santoso',
      'nisn': '1234567891',
    },
    {
      'tipe': 'Masuk',
      'jumlah': 30000,
      'waktu': '13:00',
      'nama': 'Citra Lestari',
      'nisn': '1234567892',
    },
  ];

  int getTotalTransaksi() {
    return transaksiHariIni.fold(
      0,
      (total, trx) => total + (trx['jumlah'] as int),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = getTotalTransaksi();

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('Laporan Harian Guru'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Transaksi Hari Ini',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: transaksiHariIni.length,
                itemBuilder: (context, index) {
                  final trx = transaksiHariIni[index];
                  return Card(
                    color: Colors.white,
                    elevation: 2,
                    child: ListTile(
                      leading: Icon(
                        trx['tipe'] == 'Masuk'
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        color:
                            trx['tipe'] == 'Masuk' ? Colors.green : Colors.red,
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
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Total Seluruh Transaksi: Rp $total',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: const Text('Cetak Laporan'),
                        content: const Text(
                          'Pilih format cetak laporan harian:',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Batal'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Laporan dicetak ke Word'),
                                ),
                              );
                            },
                            child: const Text('Cetak Word'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Laporan dicetak ke Excel'),
                                ),
                              );
                            },
                            child: const Text('Cetak Excel'),
                          ),
                        ],
                      ),
                );
              },
              icon: const Icon(Icons.print, color: Colors.black),
              label: const Text('Cetak'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
