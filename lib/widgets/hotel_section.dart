import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/hotel_detail_screen.dart';
import '../data/hotel_data.dart';

class HotelSection extends StatelessWidget {
  const HotelSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

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

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendedHotels.length,
            itemBuilder: (context, index) {
              final hotel = recommendedHotels[index];
              final priceFormat = NumberFormat('#,###', 'id_ID');

              Widget contentDetails = Padding(
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );

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
                  child: Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: isMobile ? double.infinity : 180,
                        height: 140,
                        child: Image.network(
                          hotel.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (isMobile) contentDetails else Expanded(child: contentDetails),
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