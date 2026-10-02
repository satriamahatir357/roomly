import 'dart:ui';

import 'package:flutter/material.dart'; //mengambil library Flutter.
import '../widgets/hero_section.dart';
import '../widgets/hotel_section.dart';
import 'hotel_detail_screen.dart';
import 'hotels_screen.dart';
import 'about_screen.dart';
import 'booking_history_screen.dart';
import '../services/user_service.dart';
import 'login_screen.dart';

// membuat widget halaman Home.
class HomeScreen extends StatelessWidget { //widget yang tidak memiliki state yang berubah.
    const HomeScreen({super.key}); //Constructor
    
    @override
    Widget build(BuildContext context) { //menentukan tampilan widget.
      final isMobile = MediaQuery.of(context).size.width < 800; //MediaQuery.of(context).size.width : mengambil lebar layar saat ini.

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
                actions: isMobile ?[
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    color: const Color(0xFFF8F7F3),
                    elevation: 8, //Memberikan bayangan sehingga menu terlihat seperti berada di atas navbar.
                    shape: RoundedRectangleBorder( //Membuat sudut popup menjadi rounded
                      borderRadius: BorderRadius.circular(16),
                    ),
                    offset: const Offset(0, 50), //Mengatur posisi popup relatif terhadap tombol hamburger. 0:tidak digeser ke kiri/kanan, 50:digeser ke bawah 50 px

                    onSelected: (value){
                      switch(value){
                        case 'home':
                          break;

                        case 'hotels':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HotelsScreen(),
                            ),
                          );
                          break;

                        case 'booking':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookingHistoryScreen(),
                            ),
                          );
                          break;
                        
                        case 'about':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutScreen(),
                            ),
                          );
                          break;

                        case 'logout':
                          userService.logout();

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                          break;
                      }
                    },

                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: 'home',
                        child: Row(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              color: Color(0xFF0F172A),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Color(0xFF0F172A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      PopupMenuItem(
                        value: 'hotels',
                        child: Row(
                          children: [
                            Icon(
                              Icons.hotel_outlined,
                              color: Color(0xFF0F172A),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Hotels',
                              style: TextStyle(
                                color: Color(0xFF0F172A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      PopupMenuItem(
                        value: 'booking',
                        child: Row(
                          children: [
                            Icon(
                              Icons.bookmark_border,
                              color: Color(0xFF0F172A),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Booking',
                              style: TextStyle(
                                color: Color(0xFF0F172A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      PopupMenuItem(
                        value: 'about',
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Color(0xFF0F172A),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'About',
                              style: TextStyle(
                                color: Color(0xFF0F172A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      PopupMenuItem(
                        value: 'logout',
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Color(0xFFC9A227),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Color(0xFFC9A227),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]
              : [
                // tombol navigasi untuk versi desktop.
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFFC9A227),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    overlayColor: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Home'),
                      const SizedBox(height: 4),
                      Container(
                        width: 24,
                        height: 2,
                        color: const Color(0xFFC9A227),
                      ),
                    ],
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotelsScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    overlayColor: Colors.transparent,
                  ),
                  child: const Text('Hotels'),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingHistoryScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    overlayColor: Colors.transparent,
                  ),
                  child: const Text('Booking'),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    overlayColor: Colors.transparent,
                  ),
                  child: const Text('About'),
                ),
                const SizedBox(width: 4),

                TextButton(
                  onPressed: () {
                    userService.logout();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFFC9A227),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    overlayColor: Colors.transparent,
                  ),
                  child: const Text('Logout'),
                ),
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