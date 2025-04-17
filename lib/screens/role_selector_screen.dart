import 'package:flutter/material.dart';

class RoleSelectorScreen extends StatelessWidget {
  const RoleSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset('assets/images/assholahiyyah.png', height: 200),
              const SizedBox(height: 40),
              _buildLoginButton(
                context,
                'Masuk sebagai Siswa',
                '/siswa/cek-saldo',
              ),
              const SizedBox(height: 16),
              _buildLoginButton(context,
                'Masuk sebagai Guru', '/login-guru'),
              const SizedBox(height: 16),
              _buildLoginButton(context, 
                'Masuk sebagai Admin', '/login-admin'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Efek pinggiran (stroke) kuning
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              foreground:
                  Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = const Color.fromARGB(255, 170, 159, 59),
            ),
          ),
          // Isi teks warna hitam
          const Text(
            '',
            style: TextStyle(), // Dummy text biar const di bawah bisa kerja
          ),
          Text(text, style: const TextStyle(fontSize: 18, color: Colors.black)),
        ],
      ),
    );
  }
}
