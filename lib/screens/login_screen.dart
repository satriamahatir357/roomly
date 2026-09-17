import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:roomly/screens/register_screen.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: LayoutBuilder( //digunakan untuk mengetahui ukuran ruang yang tersedia.
        builder: (context, Constraints){
          final isMobile = Constraints.maxWidth < 800; //Jika lebar layar kurang dari 800, dianggap mobile. Jika lebar layar 800 atau lebih, dianggap desktop/web lebar.
          
          return isMobile
            ? SingleChildScrollView(
              child: Column(
                children: [
                  _buildWelcomeSection(),
                  _buildLoginSection(context),
                ],
              ),
            )
            : Row( //menyusun widget secara horizontal.
                children: [
                  Expanded( //membuat widget mengambil ruang yang tersedia.
                    child: _buildWelcomeSection(),
                  ),
                  Expanded(
                    child: _buildLoginSection(context),
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
        top: 100,
        left: 68,
        right: 48,
        bottom: 48,
      ),
      color: const Color(0xFF0F172A),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, //Pada Column, ini membuat isi rata kiri. Tanpa ini, posisi teks bisa berada di tengah secara horizontal.
        children: [
          Image.asset(
            'assets/images/roomly_logo.png',
            width: 280,
            height: 100,
            fit: BoxFit.contain, //Membuat seluruh logo tetap terlihat tanpa terpotong.
          ),
          const SizedBox(height: 70),

          const Text(
            'Selamat datang di Roomly',
            style: TextStyle(
              color: Color(0xFFC9A227),
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 4
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'Temukan penginapan impianmu dan '
            'nikmati pengalaman menginap yang '
            'mewah bersama Roomly.',
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
  Widget _buildLoginSection(BuildContext context){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      color: const Color(0xFFF8F7F3),
      child: Center(
        child: ConstrainedBox( //Membatasi lebar form maksimal 420.
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'USER LOGIN',
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 36),

              // INPUT EMAIL
              TextField( 
                keyboardType: TextInputType.emailAddress, //Supaya keyboard/input yang muncul lebih sesuai untuk email.
                decoration: InputDecoration( //mengatur tampilan input:
                  labelText: 'Email',
                  hintText: 'Masukkan email anda',
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
            const SizedBox(height: 20),

            // INPUT PASSWORD
            TextField(
              obscureText: true, //Membuat input password menjadi tersembunyi.
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan password anda',
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
            const SizedBox(height: 28),

            // TOMBOL LOGIN
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC9A227),
                  foregroundColor: const Color(0xFF0F172A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // BAGIAN DAFTAR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Belum punya akun?',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                  ),   
                ),

                TextButton(onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                  child: const Text(
                    'Daftar',
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