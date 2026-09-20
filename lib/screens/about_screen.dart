import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget{
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Tentang Roomly',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: ConstrainedBox( //supaya teks About tidak terlalu melebar di layar desktop.
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ), 
              child: Column(
                children: [
                  const Text(
                    'Tentang Roomly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0F172A),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Roomly adalah platform pemesanan hotel yang membantu '
                    'kamu menemukan tempat menginap yang nyaman, elegan, '
                    'dan sesuai dengan kebutuhan perjalananmu.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 18,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 60),

                  const Text(
                    'Mengapa Memilih Roomly?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0F172A),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),

                  LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 800;

                    final cardWidth = isMobile
                        ? constraints.maxWidth
                        : (constraints.maxWidth - 40) / 3;

                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        SizedBox(
                          width: cardWidth,
                          child: _buildFeatureCard(
                            icon: Icons.hotel_outlined,
                            title: 'Pilihan Hotel',
                            description:
                                'Temukan berbagai pilihan hotel untuk kebutuhan perjalananmu.',
                          ),
                        ),

                        SizedBox(
                          width: cardWidth,
                          child: _buildFeatureCard(
                            icon: Icons.star_outline,
                            title: 'Pengalaman Nyaman',
                            description:
                                'Nikmati pengalaman menginap yang nyaman dan menyenangkan.',
                          ),
                        ),

                        SizedBox(
                          width: cardWidth,
                          child: _buildFeatureCard(
                            icon: Icons.payment_outlined,
                            title: 'Harga Transparan',
                            description:
                                'Lihat harga hotel dengan informasi yang jelas dan mudah dipahami.',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildFeatureCard({ //setiap kali kita memanggil method ini, kita wajib memberikan: icon → ikon yang digunakan, title → judul kartu, description → penjelasan kartu
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFFC9A227),
            size: 40,
          ),
          const SizedBox(height: 16),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}