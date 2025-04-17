import 'package:flutter/material.dart';

class TransaksiScreen extends StatelessWidget {
  const TransaksiScreen({super.key});

  void _showInputDialog(BuildContext context, String jenisTransaksi) {
    final TextEditingController namaController = TextEditingController();
    final TextEditingController nisnController = TextEditingController();
    final TextEditingController jumlahController = TextEditingController();

    // Sementara kelasnya hardcoded, nanti tinggal ambil dari data guru login
    const String kelas = "3A";

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Input Transaksi $jenisTransaksi'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: namaController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Siswa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nisnController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'NISN',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Kelas',
                      border: const OutlineInputBorder(),
                      hintText: kelas,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Jumlah Uang (Rp)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Batal'),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Lanjut'),
                onPressed: () {
                  final nama = namaController.text;
                  final nisn = nisnController.text;
                  final jumlah = jumlahController.text;

                  Navigator.pop(context); // Tutup input dialog

                  // Tampilkan dialog konfirmasi
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text('Konfirmasi Transaksi'),
                          content: Text(
                            'Apakah data berikut sudah benar?\n\n'
                            'Jenis: $jenisTransaksi\n'
                            'Nama: $nama\n'
                            'NISN: $nisn\n'
                            'Kelas: $kelas\n'
                            'Jumlah: Rp $jumlah',
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Batal'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: const Text('Benar'),
                              onPressed: () {
                                Navigator.pop(context);
                                // TODO: Proses simpan data transaksi
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '$jenisTransaksi berhasil disimpan.',
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                  );
                },
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
        title: const Text("Transaksi Tabungan"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => _showInputDialog(context, 'Setor'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Transaksi Masuk"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showInputDialog(context, 'Tarik'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Transaksi Tarik"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
