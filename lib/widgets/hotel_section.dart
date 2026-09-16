import 'package:flutter/material.dart';
import '../models/hotel.dart';

class HotelSection extends StatelessWidget{
  const HotelSection({super.key});

  final List<Hotel> hotels = const [ //membuat list yang hanya boleh berisi object bertipe Hotel.
    Hotel( 
      name: 'Roomly Grand Hotel', 
      location: 'Jakarta', 
      imageUrl: 'https://example.com/hotel1.jpg',
      price: 850000.0, 
      rating: 4.8,
    ),
    Hotel(
      name: 'Roomly Luxury Resort', 
      location: 'Bali', 
      imageUrl: 'https://example.com/hotel2.jpg',
      price: 1200000.0,
      rating: 4.9,
    ),
    Hotel(
      name: 'Roomly City Hotel',
      location: 'Bandung',
      imageUrl: 'https://example.com/hotel3.jpg',
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
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(  //ListTile adalah widget siap pakai untuk membuat baris daftar.
                  leading:const Icon(Icons.hotel),
                  title: Text(hotel.name),
                  subtitle: Text(
                    '${hotel.location} • Rp${hotel.price.toStringAsFixed(0)}',
                  ),
                  trailing: Text('⭐ ${hotel.rating}'), //Menampilkan rating di sisi kanan card.
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}