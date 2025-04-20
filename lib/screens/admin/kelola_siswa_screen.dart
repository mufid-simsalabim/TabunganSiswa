import 'package:flutter/material.dart';

class KelolaSiswaScreen extends StatefulWidget {
  const KelolaSiswaScreen({super.key});

  @override
  State<KelolaSiswaScreen> createState() => _KelolaSiswaScreenState();
}

class _KelolaSiswaScreenState extends State<KelolaSiswaScreen> {
  final List<Map<String, String>> daftarSiswa = [
    {'nama': 'Rafi', 'nis': '12345', 'kelas': 'X IPA 1'},
    {'nama': 'Dina', 'nis': '67890', 'kelas': 'XI IPS 2'},
  ];

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nisnController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  void _tambahSiswaDialog() {
    namaController.clear();
    nisnController.clear();
    kelasController.clear();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Tambah Siswa"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: namaController,
                  decoration: const InputDecoration(labelText: "Nama"),
                ),
                TextField(
                  controller: nisnController,
                  decoration: const InputDecoration(labelText: "NISN"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: kelasController,
                  decoration: const InputDecoration(labelText: "Kelas"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (namaController.text.isNotEmpty &&
                      nisnController.text.isNotEmpty &&
                      kelasController.text.isNotEmpty) {
                    setState(() {
                      daftarSiswa.add({
                        'nama': namaController.text,
                        'nis': nisnController.text,
                        'kelas': kelasController.text,
                      });
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
    );
  }

  void _importExcelDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Import Data dari Excel"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Pilih file Excel yang berisi data siswa."),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Handle file picker
                  },
                  icon: const Icon(Icons.attach_file),
                  label: const Text("Pilih File"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data berhasil diimport")),
                  );
                },
                child: const Text("Simpan"),
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
        title: const Text("Kelola Data Siswa"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _tambahSiswaDialog,
                    icon: const Icon(Icons.person_add),
                    label: const Text("Tambah Siswa"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _importExcelDialog,
                    icon: const Icon(Icons.upload_file),
                    label: const Text("Import dari Excel"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: daftarSiswa.length,
                itemBuilder: (context, index) {
                  final siswa = daftarSiswa[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.school, color: Colors.green),
                      title: Text(siswa['nama'] ?? '-'),
                      subtitle: Text(
                        'NIS: ${siswa['nis']} \nKelas: ${siswa['kelas']}',
                      ),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {
                              // TODO: Edit data siswa
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                daftarSiswa.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
