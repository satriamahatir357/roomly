import 'package:flutter/material.dart';
import '../services/wishlist_service.dart';
import 'hotel_detail_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F3),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Wishlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: wishlistService.wishlist.isEmpty
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 64,
                  color: Color(0xFFC9A227),
                ),

                SizedBox(height: 16),

                Text(
                  'Belum ada hotel favorit',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  'Yuk temukan hotel yang kamu sukai.',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: wishlistService.wishlist.length,
            itemBuilder: (context, index) {
              final hotel = wishlistService.wishlist[index];

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
              borderRadius: BorderRadius.circular(16),
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
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
                              hotel.name,
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
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Rp${hotel.price.toStringAsFixed(0)} / malam',
                              style: const TextStyle(
                                color: Color(0xFFC9A227),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tombol hapus dari Wishlist
                      IconButton(
                        onPressed: () {
                          setState(() {
                            wishlistService.removeFromWishlist(hotel);
                          });
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Color(0xFFC9A227),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}