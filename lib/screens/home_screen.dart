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
                        child: Text('Home'),
                      ),
                      PopupMenuItem(
                        value: 'hotels',
                        child: Text('Hotels'),
                      ),
                      PopupMenuItem(
                        value: 'booking',
                        child: Text('Booking'),
                      ),
                      PopupMenuItem(
                        value: 'about',
                        child: Text('About'),
                      ),
                      PopupMenuItem(
                        value: 'logout',
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                ]
              : [
                // tombol navigasi untuk versi desktop.
                TextButton(
                  onPressed: (){},
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      color: Color(0xFFC9A227),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotelsScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Hotels',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
                  child: const Text(
                    'Booking',
                     style: TextStyle(color: Colors.white),
                  ),
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
                  child: const Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),

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