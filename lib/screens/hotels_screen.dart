import 'package:flutter/material.dart';
import '../data/hotel_data.dart';
import 'hotel_detail_screen.dart';
import 'package:intl/intl.dart';

class HotelsScreen extends StatelessWidget{
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold( //kerangka dasar halaman
    backgroundColor: const Color(0xFFF8F7F3),
      appBar: AppBar( //membuat navbar bagian atas khusus halaman Hotels.
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0, //menghilangkan bayangan default
        title: const Text('Semua Hotel'),
      ),
      
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 1200, //Daftar hotel boleh melebar, tetapi maksimal sampai 1200 pixel.
          ),
          child: ListView.builder( //ListView digunakan untuk membuat daftar yang bisa di-scroll. .builder berarti: Flutter akan membuat item daftar berdasarkan data yang kita berikan. 
            padding: const EdgeInsets.all(24),
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              final hotel = hotels[index]; 
              final priceFormat = NumberFormat('#,###', 'id_ID');

              return Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 20),
                elevation: 0,
                shape: RoundedRectangleBorder( // Membuat bentuk Card menjadi persegi dengan sudut melengkung.
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelDetailScreen(
                          hotel: hotel,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar hotel
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            hotel.imageUrl,
                            width: 140,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Informasi hotel
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotel.getHotelInfo(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                hotel.location,
                                style: const TextStyle(
                                  color: Color(0xFF64748B),
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Rp${priceFormat.format(hotel.price)} / malam',
                                style: const TextStyle(
                                  color: Color(0xFFC9A227),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Rating hotel
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFC9A227),
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${hotel.rating}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}