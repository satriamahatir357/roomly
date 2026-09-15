import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget{
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context){
    return Container( //widget yang bisa digunakan untuk mengatur: ukuran,padding,margin,warna,border,background,decoration
      width: double.infinity, //Container akan mencoba menggunakan seluruh lebar yang tersedia
      padding: const EdgeInsets.symmetric( //Memberikan ruang di dalam Container.
        horizontal: 30,
        vertical: 60,
      ),
      child: Row( //menyusun widget secara horizontal.
        children: [
          Expanded( //membuat widget mengambil ruang yang tersedia di dalam Row.
            child: Column( //menyusun widget secara vertikal.
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Temukan Penginapan Impianmu',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), //Memberikan jarak antar-widget.
              const Text(
                'Jelajahi hotel mewah dan pengalaman '
                'menginap yang tak terlupakan bersama Roomly.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton( //Membuat tombol yang memiliki efek elevated/berlapis. 
                onPressed: () {}, //onPressed menentukan apa yang dilakukan ketika tombol ditekan.
                child: const Text('Jelajahi Hotel'),
              ),
            ],
            ), 
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Container(
              height: 400,
              decoration: BoxDecoration( //digunakan untuk menghias Container.
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey.shade300,
              ),
              child: const Center(
                child: Text(
                  'Hotel Image',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}