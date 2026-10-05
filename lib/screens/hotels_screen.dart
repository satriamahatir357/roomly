import 'package:flutter/material.dart';
import '../data/hotel_data.dart';
import 'hotel_detail_screen.dart';
import 'package:intl/intl.dart';
import '../services/wishlist_service.dart';
import '../models/hotel.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  String searchQuery = '';
  double? maxPrice; //harga hotel kita menggunakan angka desimal
  String sortOption = 'rating'; //sortOption → nama variabel untuk menyimpan pilihan sorting.

  bool isFavorite(Hotel hotel) {
    return wishlistService.wishlist.contains(hotel); //mengecek apakah hotel tersebut ada di dalam list Wishlist.
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    final filteredHotels = hotels.where((hotel) { //Ambil hotel yang memenuhi kondisi tertentu.
      final matchesSearch = //menyimpan hasil pengecekan Search Bar.
          hotel.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          hotel.location.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesPrice = //Apakah harga hotel lebih kecil atau sama dengan batas harga?
          maxPrice == null || hotel.price <= maxPrice!;

      return matchesSearch && matchesPrice;
    }).toList();

    if (sortOption == 'rating') { //sortOption adalah state yang menyimpan pilihan sorting user, sedangkan if / else if adalah logika yang menentukan bagaimana list tersebut diurutkan.
      filteredHotels.sort((a, b) {
        return b.rating.compareTo(a.rating);
      });
    } else if (sortOption == 'price_low') {
      filteredHotels.sort((a, b) {
        return a.price.compareTo(b.price);
      });
    } else if (sortOption == 'price_high') {
      filteredHotels.sort((a, b) {
        return b.price.compareTo(a.price);
      });
    }

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

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    // Filter Harga
                    SizedBox(
                      width: isMobile
                          ? (MediaQuery.of(context).size.width - 64) / 2 //Jika layar lebih kecil dari 800px, maka lebar DropdownButtonFormField akan menyesuaikan dengan lebar layar dikurangi padding kiri dan kanan (24 + 24 = 48) dibagi 2. Sehingga akan ada dua dropdown di satu baris.
                          : 280,
                      child: DropdownButtonFormField<double?>(
                        initialValue: maxPrice,

                        decoration: InputDecoration(
                          // Icon filter
                          prefixIcon: const Icon(
                            Icons.filter_list,
                            color: Color(0xFFC9A227),
                          ),

                          // Background
                          filled: true,
                          fillColor: Colors.white,

                          // Border normal
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFE2E8F0),
                            ),
                          ),

                          // Border saat digunakan
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFC9A227),
                              width: 1.5,
                            ),
                          ),
                        ),

                        items: const [
                          DropdownMenuItem<double?>(
                            value: null,
                            child: Text('Semua Harga'),
                          ),
                          DropdownMenuItem<double?>(
                            value: 700000,
                            child: Text('≤ Rp700 rb'),
                          ),
                          DropdownMenuItem<double?>(
                            value: 1000000,
                            child: Text('≤ Rp1 jt'),
                          ),
                          DropdownMenuItem<double?>(
                            value: 1500000,
                            child: Text('≤ Rp1,5 jt'),
                          ),
                        ],

                        onChanged: (value) {
                          setState(() {
                            maxPrice = value;
                          });
                        },
                      ),
                    ),

                    // Sorting
                    SizedBox(
                      width: isMobile
                          ? (MediaQuery.of(context).size.width - 64) / 2
                          : 280,
                      child: DropdownButtonFormField<String>(
                        initialValue: sortOption,

                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.sort,
                            color: Color(0xFFC9A227),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFE2E8F0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFC9A227),
                              width: 1.5,
                            ),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'rating',
                            child: Text('Rating Tertinggi'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'price_low',
                            child: Text('Harga Termurah'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'price_high',
                            child: Text('Harga Termahal'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            sortOption = value!;
                          });
                        },
                      ),
                    ),
                  ],
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

                              // Tombol Wishlist
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isFavorite(hotel)) {
                                      wishlistService.removeFromWishlist(hotel);
                                    } else {
                                      wishlistService.addToWishlist(hotel);
                                    }
                                  });
                                },
                                icon: Icon(
                                  isFavorite(hotel)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: const Color(0xFFC9A227),
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
          ),
        ],
      ),
    );
  }
}