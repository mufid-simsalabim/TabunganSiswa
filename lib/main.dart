import 'package:flutter/material.dart';
import 'package:tabungan_siswa/screens/admin/admin_kelola_guru_screen.dart';
import 'package:tabungan_siswa/screens/role_selector_screen.dart';
import 'package:tabungan_siswa/screens/guru/login_guru_screen.dart';
import 'package:tabungan_siswa/screens/admin/login_admin_screen.dart';
import 'package:tabungan_siswa/screens/siswa/cek_saldo_screen.dart';
import 'package:tabungan_siswa/screens/guru/transaksi_screen.dart';
import 'package:tabungan_siswa/screens/admin/dashboard_screen.dart';
import 'package:tabungan_siswa/screens/admin/kelola_siswa_screen.dart';
import 'package:tabungan_siswa/screens/admin/riwayat_transaksi_screen.dart';
import 'package:tabungan_siswa/screens/admin/laporan_screen.dart';
import 'screens/guru/guru_home_screen.dart';
import 'screens/guru/guru_laporan_harian_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabungan Siswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const RoleSelectorScreen(),
        '/login-guru': (context) => const LoginGuruScreen(),
        '/login-admin': (context) => const LoginAdminScreen(),
        '/siswa/cek-saldo': (context) => const CekSaldoScreen(),
        '/guru/transaksi': (context) => const TransaksiScreen(),
        '/admin/dashboard': (context) => const DashboardAdminScreen(),
        '/admin/kelola-siswa': (context) => const KelolaSiswaScreen(),
        '/admin/riwayat': (context) => const RiwayatTransaksiScreen(),
        '/admin/laporan': (context) => const LaporanScreen(),
        '/guru/home': (context) => const GuruHomeScreen(),
        '/guru/cek-saldo': (context) => const CekSaldoScreen(),
        '/guru/laporan-harian': (context) => const GuruLaporanHarianScreen(),
        '/admin/kelola-guru': (context) => const KelolaAkunGuruScreen(),
        '/admin/cek-saldo': (context) => const CekSaldoScreen(),
      },
    );
  }
}
