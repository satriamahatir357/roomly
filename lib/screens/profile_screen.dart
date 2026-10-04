import 'package:flutter/material.dart';
import '../services/user_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F3),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Mengatur ukuran kolom agar sesuai dengan kontennya.
              children: [
                const CircleAvatar( // menampilkan avatar pengguna.
                  radius: 45,
                  backgroundColor: Color(0xFF0F172A),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Color(0xFFC9A227),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  userService.currentUser?.name ?? 'User', //userService.currentUser?.name menampilkan nama pengguna yang sedang login. Jika tidak ada nama pengguna, maka akan menampilkan 'User'.
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  userService.currentUser?.email ?? '-', // menampilkan email pengguna.
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}