import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:roomly/screens/register_screen.dart';
import 'package:roomly/screens/home_screen.dart';
import '../services/user_service.dart';

class LoginScreen extends StatefulWidget{ //karena nanti video bisa berubah kondisinya: loading → siap → play.
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  //LoginScreen adalah bagian widget-nya, sedangkan _LoginScreenState menyimpan keadaan yang bisa berubah.
  }

  class _LoginScreenState extends State<LoginScreen>{
    final TextEditingController _emailController =
        TextEditingController();

    final TextEditingController _passwordController =
        TextEditingController();

    late VideoPlayerController _videoController; //late Artinya: variabel ini belum diisi sekarang, tapi nanti pasti akan diisi sebelum digunakan.
    
    bool _isPasswordVisible = false;
    bool _isVideoInitialized = false;

    @override
    void initState() { //persiapan video 
      super.initState(); //tampilan login
    
      _videoController = VideoPlayerController.asset( //membuat sebuah controller video yang sumber videonya berasal dari asset lokal.
        'assets/videos/login_background.mp4',
      );

      _videoController.initialize().then((_) {
        _videoController.setLooping(true);
        _videoController.setVolume(0);
        _videoController.play();

        if (mounted) { //mounted: initialize() itu proses asynchronous. Artinya, prosesnya bisa selesai setelah halaman Login sudah ditutup.
          setState(() {
            _isVideoInitialized = true;
          });
        }
      });
    }

    @override
    void dispose() { 
      _emailController.dispose();
      _passwordController.dispose();
      _videoController.dispose(); //Controller video menggunakan resource dari video.
      super.dispose();
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        body: Stack( //Stack memungkinkan beberapa widget ditumpuk di posisi yang sama.
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
            Positioned.fill( //Widget ini memenuhi seluruh area Stack.
              child: Container(
                color: const Color(0x990F172A),
              ),
            ),

            // Login card
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width < 600 //mengambil lebar layar saat ini.
                        ? 300
                        : 420,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xF2F8F7F3),
                      borderRadius: BorderRadius.circular(20),
                    ),
              
                  child: Column(
                    mainAxisSize: MainAxisSize.min, //Column mengambil tinggi secukupnya sesuai isi, bukan memenuhi seluruh tinggi card.
                        children: [
                          Image.asset(
                            'assets/images/roomly_logo.png',
                            width: 160,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12),

                          const Text(
                            'USER LOGIN',
                            style: TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2, //Mengatur jarak antar karakter.
                            ),
                          ),
                          const SizedBox(height: 20),

                          TextField( //widget untuk menerima input dari user.
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress, //Flutter akan tahu bahwa field ini digunakan untuk email.
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Masukkan email anda',
                              prefixIcon: const Icon(Icons.email_outlined),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          TextField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Masukkan password anda',
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton( //suffixIcon : berarti icon ditempatkan di ujung kanan TextField.
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
                          const SizedBox(height: 18),

                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton( //Ini widget tombol Flutter yang cocok untuk aksi utama seperti Login.
                              onPressed: () {
                                final success = userService.login(
                                  _emailController.text,
                                  _passwordController.text,
                                );

                                if (success) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Email atau password salah.'),
                                    ),
                                  );
                                }
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
                          const SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Belum punya akun?',
                                style: TextStyle(
                                  color: Color(0xFF64748B),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute( //memberi tahu Flutter bahwa halaman baru yang mau dibuka adalah sebuah route.
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
              )
            ),
          ],
        ),
      );
  }
}