import 'dart:ui';

import 'package:flutter/material.dart'; //mengambil library Flutter.
import '../widgets/hero_section.dart';
import '../widgets/hotel_section.dart';
import 'hotel_detail_screen.dart';

// membuat widget halaman Home.
class HomeScreen extends StatelessWidget { //widget yang tidak memiliki state yang berubah.
    const HomeScreen({super.key}); //Constructor
    
    @override
    Widget build(BuildContext context) { //menentukan tampilan widget.
        return Scaffold( //kerangka dasar halaman.
          backgroundColor: const Color(0xFFF8F7F3),

            appBar: AppBar( //bagian header atas.
              backgroundColor: const Color(0xFF0F172A),
              foregroundColor: Colors.white, //warna default untuk elemen yang berada di AppBar, seperti icon dan teks, menjadi putih.
              elevation: 0, //mengatur efek bayangan pada widget Material.

                title: const Text(
                  'Roomly',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),  
                ),
                
                centerTitle: true,
                actions: [ //daftar widget yang ditampilkan di sisi kanan AppBar
                    TextButton(
                        onPressed: () {}, //tombol sudah bisa ditekan, tetapi belum melakukan apa-apa
                        child: const Text(
                          'Home',
                          style: TextStyle(
                            color: Color(0xFFC9A227),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),

                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Hotels',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                    ),

                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'About',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                    ),
                    const SizedBox(width: 16,), //untuk memberikan ukuran atau jarak
                ],
            ),

            body: SingleChildScrollView(
                child: const Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                        HeroSection(),
                        HotelSection(),
                    ],
                  ),
                ),
            ),
        );
    }
}