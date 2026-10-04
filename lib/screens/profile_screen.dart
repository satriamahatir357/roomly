import 'package:flutter/material.dart';
import '../services/user_service.dart';
import 'login_screen.dart';

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    decoration: const BoxDecoration(
                      color: Color(0xFF0F172A),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xFFC9A227),
                      child: Icon(
                        Icons.person,
                        size: 55,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),

                  // Isi Profil
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        // Nama user
                        Text(
                          userService.currentUser?.name ?? 'User',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),

                        const SizedBox(height: 6),

                        // Email user
                        Text(
                          userService.currentUser?.email ?? '-',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF64748B),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Garis pemisah
                        const Divider(
                          color: Color(0xFFE2E8F0),
                        ),

                        const SizedBox(height: 24),

                        // Informasi akun
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Informasi Akun',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Nama
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.person_outline,
                            color: Color(0xFFC9A227),
                          ),
                          title: const Text(
                            'Nama',
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 13,
                            ),
                          ),
                          subtitle: Text(
                            userService.currentUser?.name ?? '-',
                            style: const TextStyle(
                              color: Color(0xFF0F172A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        // Email
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFFC9A227),
                          ),
                          title: const Text(
                            'Email',
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 13,
                            ),
                          ),
                          subtitle: Text(
                            userService.currentUser?.email ?? '-',
                            style: const TextStyle(
                              color: Color(0xFF0F172A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Tombol Logout
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              userService.logout();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.logout),
                            label: const Text('Logout'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0F172A),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}