import 'package:flutter/material.dart';

class KelolaAkunGuruScreen extends StatelessWidget {
  const KelolaAkunGuruScreen({super.key});

  // Dummy data akun guru
  final List<Map<String, String>> daftarGuru = const [
    {'nama': 'Bu Rina', 'nip': '198201011234', 'email': 'rina@guru.com'},
    {'nama': 'Pak Budi', 'nip': '197912301234', 'email': 'budi@guru.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('Kelola Akun Guru'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Arahkan ke form tambah akun guru
              },
              icon: const Icon(Icons.person_add),
              label: const Text('Tambah Guru'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[300],
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: daftarGuru.length,
                itemBuilder: (context, index) {
                  final guru = daftarGuru[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.green),
                      title: Text(guru['nama'] ?? '-'),
                      subtitle: Text('NIP: ${guru['nip']}\n${guru['email']}'),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {
                              // TODO: Edit akun guru
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // TODO: Hapus akun guru
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
