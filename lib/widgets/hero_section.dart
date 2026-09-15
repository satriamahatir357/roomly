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
          Expanded( //digunakan untuk membuat widget mengisi ruang yang tersedia di dalam Row atau Column.
            child: ClipRRect( //digunakan untuk memotong tampilan widget mengikuti bentuk sudut tertentu.
              borderRadius: BorderRadius.circular(24),
              child: Image.asset( //digunakan untuk menampilkan gambar yang berasal dari folder aset project Flutter.
                'assets/images/hotel-hero.jpg',
                height: 400,
                fit: BoxFit.cover, //membuat gambar memenuhi area yang tersedia. Gambar memenuhi area, mungkin ada bagian yang terpotong.
              ),
            ),
          ),
        ],
      ),
    );
  }
}