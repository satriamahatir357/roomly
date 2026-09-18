import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/hotel.dart';
import '../screens/hotel_detail_screen.dart';

class HotelSection extends StatelessWidget{
  const HotelSection({super.key});

  final List<Hotel> hotels = const [ //membuat list yang hanya boleh berisi object bertipe Hotel.
    Hotel( 
      name: 'Roomly Grand Hotel', 
      location: 'Jakarta', 
      imageUrl: 'https://images.unsplash.com/photo-1551286923-c82d6a8ae079?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fHw%3D',
      price: 850000.0, 
      rating: 4.8,
    ),
    Hotel(
      name: 'Roomly Luxury Resort', 
      location: 'Bali', 
      imageUrl: 'https://images.unsplash.com/photo-1660839638327-3943e1846e3a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
      price: 1200000.0,
      rating: 4.9,
    ),
    Hotel(
      name: 'Roomly City Hotel',
      location: 'Bandung',
      imageUrl: 'https://images.unsplash.com/photo-1789073730743-1610768a9ac6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDI5fHx8ZW58MHx8fHx8',
      price: 650000.0,
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context){
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
            itemCount: hotels.length, 
            itemBuilder: (context, index){ //itemBuilder = fungsi untuk membuat setiap item. index = nomor urut item, dimulai dari 0.
              final hotel = hotels[index]; //Mengambil satu data hotel berdasarkan posisi index
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
                        width: 240,
                        height: 160,
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
                                  fontSize: 22,
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