import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/hotel.dart';

class HotelDetailScreen extends StatelessWidget{
  final Hotel hotel; //Menyimpan data hotel yang dipilih.

  const HotelDetailScreen({
    super.key,
    required this.hotel, //setiap kali membuka detail, kita wajib mengirim data hotel.
  });
    
  @override
  Widget build(BuildContext context){
    final priceFormat = NumberFormat('#,###', 'id_ID');

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F3),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          hotel.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 320,
              child: Image.network(
                hotel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          
          // INFORMASI HOTEL
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: const TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFF64748B),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      hotel.location,
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Text(
                  'Rp ${priceFormat.format(hotel.price)}',
                  style: const TextStyle(
                    color: Color(0xFFC9A227),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  ' / malam',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFC9A227),
                    ),
                    const SizedBox(width: 6),

                    Text(
                      '${hotel.rating}',
                      style: const TextStyle(
                        color: Color(0xFF0F172A),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),  
                  ],
                ),
                const SizedBox(height: 32),

                const Text(
                  'Deskripsi Hotel',
                  style: TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                const Text(
                  'Nikmati pengalaman menginap yang nyaman '
                  'dan mewah bersama Roomly. Hotel ini menyediakan '
                  'fasilitas terbaik untuk membuat perjalananmu '
                  'menjadi lebih menyenangkan.',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),

                // TOMBOL PESAN
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar( //Mengambil pengelola pesan dari Scaffold yang sedang aktif.
                        SnackBar( //Menampilkan pesan kecil sementara di bagian bawah layar.
                          content: Text(
                            'Pemesanan ${hotel.name} belum tersedia.',
                          ),
                        ),
                      );
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A227),
                      foregroundColor: const Color(0xFF0F172A),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'PESAN SEKARANG',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
          ],
        ),
        
      ),
    );
  }
}