import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          return isMobile 
            ? SingleChildScrollView(
              child: Column(
                children: [
                  _buildWelcomeSection(),
                  _buildRegisterSection(context),
                ],
              ),
            )
            : Row(
              children: [
                Expanded(
                  child: _buildWelcomeSection(),
                ),
                Expanded(
                  child: _buildRegisterSection(context),
                ),
              ],
            );
        },
      ),
    );
  }

  // === BAGIAN KIRI ===
  Widget _buildWelcomeSection(){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 80,
        left: 68,
        right: 48,
        bottom: 48,
      ),
    color: const Color(0xFF0F172A),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/roomly_logo.png',
          width: 280,
          height: 110,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 70),

        const Text(
          'Bergabung bersama Roomly',
          style: TextStyle(
            color: Color(0xFFC9A227),
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        const Text(
          'Buat akun Roomly dan temukan '
          'penginapan terbaik untuk perjalananmu.',
          style: TextStyle(
            color: Color(0xFFCBD5E1),
            fontSize: 17,
            height: 1.6,
          ),
        ),
      ],
    ),
    );
  }

  // === BAGIAN KANAN ===
  Widget _buildRegisterSection(BuildContext context){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      color: const Color(0xFFF8F7F3),
      child: Center(
        child: ConstrainedBox( //Membatasi lebar form agar tidak terlalu lebar di desktop.
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BUAT AKUN',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 30),

              // INPUT NAMA
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nama lengkap',
                  hintText: 'Masukkan nama lengkap',
                  prefixIcon: const Icon(
                    Icons.person_outline,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // INPUT EMAIL
              TextField(
                keyboardType: TextInputType.emailAddress, //Mengatur jenis keyboard/input untuk email.
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan email kamu',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16), 
                
                // INPUT PASSWORD
                TextField(
                  obscureText: true, //Menyembunyikan isi password.
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Buat password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // KONFIRMASI PASSWORD
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi password',
                    hintText: 'Ulangi password',
                    prefixIcon: const Icon(
                      Icons.lock_reset_outlined,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // TOMBOL DAFTAR
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi daftar dibuat nanti
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color(0xFFC9A227),
                      foregroundColor: const Color(0xFF0F172A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'DAFTAR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // LINK KEMBALI KE LOGIN
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sudah punya akun?',
                      style: TextStyle(
                        color: Color(0xFF64748B),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); //Digunakan untuk kembali ke halaman sebelumnya.
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFFC9A227),
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}