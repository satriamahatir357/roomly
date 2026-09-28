import '../models/booking.dart';

class BookingService { //tempat menyimpan semua Booking
  final List<Booking> _bookings = [];

  // method
  void addBooking(Booking booking) { //menambahkan Booking
    _bookings.add(booking); 
  }

  //getter
  List<Booking> get bookings => _bookings; //mengambil daftar Booking
}

final bookingService = BookingService(); //shared instance