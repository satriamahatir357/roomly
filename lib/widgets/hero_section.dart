import 'package:flutter/material.dart'; // Berisi widget dasar Flutter seperti Container, Text, Column, dan Button.

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( // Container mengatur lebar dan jarak bagian hero section.
      width: double.infinity,
      color: const Color(0xFFF8F7F3),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),

      child: LayoutBuilder( //LayoutBuilder digunakan agar tampilan bisa responsive.
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800; // Jika lebar layar kurang dari 800, dianggap mobile.
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isMobile ? 500 : double.infinity,
              ),
              child: Flex(
                direction: isMobile
                    ? Axis.vertical
                    : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Align(
                      alignment: Alignment.center,
                        child: Column( // Column menyusun judul, deskripsi, dan tombol dari atas ke bawah.
                        crossAxisAlignment: isMobile
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        
                        children: [
                          Text(
                            'Temukan Penginapan Impianmu',
                            textAlign: isMobile
                              ? TextAlign.center
                              : TextAlign.start,
                            style: const TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 20),

                          Text(
                            'Jelajahi hotel mewah dan pengalaman '
                            'menginap yang tak terlupakan bersama Roomly.',
                            textAlign: isMobile
                              ? TextAlign.center
                              : TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 18,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 32),

                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC9A227),
                              foregroundColor: const Color(0xFF0F172A),
                              elevation: 0,

                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 16,
                              ),

                              shape: RoundedRectangleBorder( 
                                borderRadius: BorderRadius.circular(12), //Membuat sudut tombol melengkung sebesar 12.
                              ),
                            ),

                            child: const Text(
                              'Jelajahi Hotel',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox( // Jarak berubah sesuai ukuran layar.
                    width: isMobile ? 0 : 30,
                    height: isMobile ? 40 : 0,
                  ),

                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: ClipRRect( // Membuat sudut gambar menjadi melengkung.
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset( // Gambar memenuhi area tanpa terlihat gepeng.
                        'assets/images/hotel-hero.jpg',
                        height: isMobile ? 260 : 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}