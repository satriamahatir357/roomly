import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/hotel_detail_screen.dart';
import '../data/hotel_data.dart';

class HotelSection extends StatelessWidget{
  const HotelSection({super.key});

  @override
  Widget build(BuildContext context){
    final recommendedHotels = ([...hotels]
        ..sort((a, b) => b.rating.compareTo(a.rating)))
      .take(3)
      .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hotel Terpopuler',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ListView.builder( //Digunakan untuk membuat daftar secara dinamis.
            shrinkWrap: true, //Memberitahu ListView agar menyesuaikan tinggi berdasarkan isi list.
            physics: const NeverScrollableScrollPhysics(), //Menonaktifkan scroll pada ListView bagian dalam.
            itemCount: recommendedHotels.length, 
            itemBuilder: (context, index){ //itemBuilder = fungsi untuk membuat setiap item. index = nomor urut item, dimulai dari 0.
              final hotel = recommendedHotels[index];
              final priceFormat = NumberFormat('#,###', 'id_ID'); //Digunakan untuk mengatur format angka sesuai Indonesia.
              return InkWell(
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
                child: Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox( //Bagian ini mengatur ukuran gambar
                        width: 180,
                        height: 140,
                        child: Image.network(
                          hotel.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotel.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 16),

                              Text(
                                '📍 ${hotel.location}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                'Rp${priceFormat.format(hotel.price)} / malam',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                '⭐ ${hotel.rating}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}