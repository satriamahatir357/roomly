import 'package:flutter/material.dart';
import '../models/booking.dart';
import 'package:intl/intl.dart';

class BookingSummaryScreen extends StatelessWidget{
  final Booking booking; //halaman ini menyimpan satu object Booking.

  const BookingSummaryScreen({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat('#,###', 'id_ID');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ringkasan Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.hotel.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),

            Text(
              booking.hotel.location,
              style:  const TextStyle(
                fontSize: 16,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 24),

            Text(
              'Nama Tamu: ${booking.guestName}',
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),

            Text(
              'Jumlah Malam: ${booking.numberOfNights} malam',
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),

            Text(
              'Harga per malam: Rp ${priceFormat.format(booking.hotel.price)}',
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),

            Text(
              'Total Harga: Rp ${priceFormat.format(booking.calculateTotalPrice())}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC9A227),
              ),
            ),
          ],
        ),
      ),
    );
  }
}