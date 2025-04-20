import 'package:flutter/material.dart';

class LaporanScreen extends StatefulWidget {
  const LaporanScreen({super.key});

  @override
  State<LaporanScreen> createState() => _LaporanScreenState();
}

class _LaporanScreenState extends State<LaporanScreen> {
  String? _jenisLaporan;

  final List<Map<String, dynamic>> laporanHarian = const [
    {
      'nama': 'Andi Wijaya',
      'nisn': '1234567890',
      'kelas': 'XII IPA 1',
      'tipe': 'Masuk',
      'jumlah': 50000,
      'waktu': '08:30',
    },
    {
      'nama': 'Budi Santoso',
      'nisn': '1234567891',
      'kelas': 'XII IPS 2',
      'tipe': 'Tarik',
      'jumlah': 20000,
      'waktu': '10:15',
    },
  ];

  final List<Map<String, dynamic>> laporanKeseluruhan = const [
    {
      'nama': 'Andi Wijaya',
      'nisn': '1234567890',
      'kelas': 'XII IPA 1',
      'total': 200000,
    },
    {
      'nama': 'Budi Santoso',
      'nisn': '1234567891',
      'kelas': 'XII IPS 2',
      'total': 150000,
    },
    {
      'nama': 'Citra Lestari',
      'nisn': '1234567892',
      'kelas': 'XII IPA 3',
      'total': 300000,
    },
  ];

  void _showPrintDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Cetak Laporan'),
            content: const Text('Pilih format cetak laporan:'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Laporan dicetak ke Word')),
                  );
                },
                child: const Text('Cetak Word'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Laporan dicetak ke Excel')),
                  );
                },
                child: const Text('Cetak Excel'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text("Laporan Transaksi"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Jenis Laporan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              hint: const Text("Pilih jenis laporan"),
              value: _jenisLaporan,
              items: const [
                DropdownMenuItem(
                  value: 'harian',
                  child: Text('Laporan Harian'),
                ),
                DropdownMenuItem(
                  value: 'keseluruhan',
                  child: Text('Laporan Keseluruhan'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _jenisLaporan = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child:
                    _jenisLaporan == null
                        ? const Center(
                          child: Text("Silakan pilih jenis laporan"),
                        )
                        : _jenisLaporan == 'harian'
                        ? ListView.builder(
                          itemCount: laporanHarian.length,
                          itemBuilder: (context, index) {
                            final data = laporanHarian[index];
                            return ListTile(
                              leading: Icon(
                                data['tipe'] == 'Masuk'
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,
                                color:
                                    data['tipe'] == 'Masuk'
                                        ? Colors.green
                                        : Colors.red,
                              ),
                              title: Text(
                                '${data['nama']} (${data['nisn']})',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Kelas: ${data['kelas']}\n${data['tipe']} - Rp${data['jumlah']}\nWaktu: ${data['waktu']}',
                              ),
                              isThreeLine: true,
                            );
                          },
                        )
                        : ListView.builder(
                          itemCount: laporanKeseluruhan.length,
                          itemBuilder: (context, index) {
                            final data = laporanKeseluruhan[index];
                            return ListTile(
                              leading: const Icon(
                                Icons.person,
                                color: Colors.green,
                              ),
                              title: Text(
                                '${data['nama']} (${data['nisn']})',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Kelas: ${data['kelas']}\nTotal Transaksi: Rp${data['total']}',
                              ),
                              isThreeLine: true,
                            );
                          },
                        ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _jenisLaporan != null ? _showPrintDialog : null,
              icon: const Icon(Icons.print),
              label: const Text("Cetak"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[300],
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
