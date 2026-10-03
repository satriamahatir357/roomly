import 'package:flutter/material.dart';
import '../data/hotel_data.dart';
import 'hotel_detail_screen.dart';
import 'package:intl/intl.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    final filteredHotels = hotels.where((hotel) { //Ambil hotel yang memenuhi kondisi tertentu.
      return hotel.name.toLowerCase().contains(searchQuery.toLowerCase()) || //Mencari berdasarkan nama hotel.
          hotel.location.toLowerCase().contains(searchQuery.toLowerCase()); //Mencari berdasarkan lokasi hotel.
    }).toList();

    return Scaffold( //kerangka dasar halaman
    backgroundColor: const Color(0xFFF8F7F3),
      appBar: AppBar( //membuat navbar bagian atas khusus halaman Hotels.
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0, //menghilangkan bayangan default
        title: const Text('Semua Hotel'),
      ),
      
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 12), //EdgeInsets.fromLTRB itu cara Flutter untuk menentukan jarak/padding secara terpisah untuk 4 sisi. LTRB : L = Left → kiri, T = Top → atas, R = Right → kanan, B = Bottom → bawah
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari hotel atau lokasi...',
                hintStyle: const TextStyle(
                  color: Color(0xFF94A3B8),
                ),

                // Icon pencarian
                prefixIcon: const Icon( //Menambahkan icon pencarian di sebelah kiri Search Bar.
                  Icons.search,
                  color: Color(0xFF0F172A),
                ),

                // Background Search Bar
                filled: true,
                fillColor: Colors.white,

                // Saat tidak sedang diklik
                enabledBorder: OutlineInputBorder( //enabledBorder digunakan untuk menentukan tampilan border saat TextField tidak sedang fokus. OutlineInputBorder digunakan untuk membuat border berbentuk garis luar.
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFE2E8F0),
                  ),
                ),

                // Saat sedang diklik/mengetik
                focusedBorder: OutlineInputBorder( //focusedBorder digunakan untuk menentukan tampilan border saat TextField sedang fokus. OutlineInputBorder digunakan untuk membuat border berbentuk garis luar.
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xFFC9A227),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          // Daftar hotel
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1200,
                ),
                child: ListView.builder( //ListView digunakan untuk membuat daftar yang bisa di-scroll. .builder berarti: Flutter akan membuat item daftar berdasarkan data yang kita berikan. 
                  padding: const EdgeInsets.all(24),
                  itemCount: filteredHotels.length,
                  itemBuilder: (context, index) {
                    final hotel = filteredHotels[index];
                    final priceFormat = NumberFormat('#,###', 'id_ID');

                    Widget hotelDetails = Column(
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
                    );

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
                          child: Flex(
                            direction: isMobile ? Axis.vertical : Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Gambar hotel
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  hotel.imageUrl,
                                  width: isMobile ? double.infinity : 140,
                                  height: isMobile ? 180 : 100, 
                                  fit: BoxFit.cover,
                                ),
                              ),

                              SizedBox(
                                width: isMobile ? 0 : 16,
                                height: isMobile ? 16 : 0,
                              ),

                              // Informasi hotel
                              if (isMobile)
                                hotelDetails
                              else
                                Expanded(
                                  child: hotelDetails,
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
          ),
        ],
      ),
    );
  }
}