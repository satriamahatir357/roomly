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
            itemCount: hotels.length, //Buat item sebanyak jumlah hotel yang ada di dalam list hotels
            itemBuilder: (context, index) {
              final hotel = hotels[index]; //Mengambil hotel berdasarkan index
              final priceFormat = NumberFormat('#,###', 'id_ID');

              return Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 20),
                elevation: 0,
                shape: RoundedRectangleBorder( //memotong/bentuk sudut widget menjadi rounded rectangle.
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile( //widget yang memang dibuat untuk membuat item daftar.
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network( //bagian sebelah kiri.
                      hotel.imageUrl,
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover, //supaya gambar memenuhi area tanpa terlihat gepeng.
                    ),
                  ),

                  title: Text(
                    hotel.getHotelInfo(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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

                  trailing: Row( //secara default bisa mencoba mengambil ruang sebanyak mungkin
                    mainAxisSize: MainAxisSize.min, //Row ini ambil ruang secukupnya sesuai isi. Jadi rating tidak memakan seluruh area sebelah kanan
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

                  onTap: () { //bagian yang menghubungkan ke halaman detail
                    Navigator.push( //untuk membuka halaman baru.
                      context,
                      MaterialPageRoute( //menentukan halaman yang mau dibuka
                        builder: (context) => HotelDetailScreen(
                          hotel: hotel,
                        ), 
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}