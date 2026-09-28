import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late VideoPlayerController _videoController; //Untuk mengontrol video background.
  bool _isVideoInitialized = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final TextEditingController _nameController = //_nameController adalah objek yang mengontrol sebuah TextField, sedangkan .text digunakan untuk mengambil teks yang sedang dimasukkan user.
    TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(
      'assets/videos/login_background.mp4',
    );

    _videoController.initialize().then((_) {
      _videoController.setLooping(true);
      _videoController.setVolume(0);
      _videoController.play();

      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background video
          if (_isVideoInitialized)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            ),

          // Overlay gelap
          Positioned.fill(
            child: Container(
              color: const Color(0x990F172A),
            ),
          ),

          // Register card
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildRegisterSection(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterSection(BuildContext context){
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width < 600
            ? 300
            : 420,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xF2F8F7F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: ConstrainedBox( //Membatasi lebar form agar tidak terlalu lebar di desktop.
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/roomly_logo.png',
                width: 160,
                height: 60,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 12),

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
                controller: _nameController,
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
                controller: _emailController,
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
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Buat password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
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
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi password',
                    hintText: 'Ulangi password',
                    prefixIcon: const Icon(
                      Icons.lock_reset_outlined,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
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
                      if (_nameController.text.isEmpty) { //Kalau isi TextField nama kosong...
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Nama lengkap wajib diisi.'),
                          ),
                        );
                        return; //Hentikan proses onPressed di titik ini.
                      }

                      if (_emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Email wajib diisi.'),
                          ),
                        );
                        return;
                      }

                      if (!_emailController.text.endsWith('@gmail.com')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Email harus menggunakan @gmail.com.'),
                          ),
                        );
                        return;
                      }

                      if (_passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password wajib diisi.'),
                          ),
                        );
                        return;
                      }

                      if (_passwordController.text.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password minimal 8 karakter.'),
                          ),
                        );
                        return;
                      }

                      if (_confirmPasswordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Konfirmasi password wajib diisi.'),
                          ),
                        );
                        return;
                      }

                      if (_passwordController.text != _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password dan konfirmasi password tidak sama.'),
                          ),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registrasi berhasil.'),
                        ),
                      );
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