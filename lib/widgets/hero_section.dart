import 'package:flutter/material.dart'; // Berisi widget dasar Flutter seperti Container, Text, Column, dan Button.

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( // Container mengatur lebar dan jarak bagian hero section.
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 60,
      ),

      child: LayoutBuilder( //LayoutBuilder digunakan agar tampilan bisa responsive.
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800; // Jika lebar layar kurang dari 800, dianggap mobile.
          return Flex( 
            direction: isMobile //Mobile: susunan vertikal. Desktop: susunan horizontal.
                ? Axis.vertical
                : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
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
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
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
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 32),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Jelajahi Hotel'),
                    ),
                  ],
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
                    height: isMobile ? 300 : 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}