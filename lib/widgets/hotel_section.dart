import 'package:flutter/material.dart';

class HotelSection extends StatelessWidget{
  const HotelSection({super.key});

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
            itemCount: 3, //jumlah item adalah 3.
            itemBuilder: (context, index){ //itemBuilder = fungsi untuk membuat setiap item. index = nomor urut item, dimulai dari 0.
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(  //ListTile adalah widget siap pakai untuk membuat baris daftar.
                  leading:const Icon(Icons.hotel),
                  title: Text('Hotel Roomly ${index+1}'),
                  subtitle: const Text('Hotel Mewah dan Nyaman'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}