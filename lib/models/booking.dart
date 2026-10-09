import 'hotel.dart';

class Booking {
  String _bookingId;
  String _userEmail;
  String _guestName;
  Hotel _hotel;
  int _numberOfNights;
  DateTime _checkInDate; //DateTime adalah tipe data Dart untuk menyimpan tanggal dan waktu
  DateTime _checkOutDate;

  // Constructor
  Booking({
    required String bookingId,
    required String userEmail,
    required String guestName,
    required Hotel hotel,
    required int numberOfNights,
    required DateTime checkInDate,
    required DateTime checkOutDate,
  })  : _bookingId = bookingId, //menyimpan ID booking
        _userEmail = userEmail, // Menyimpan email pemilik booking
        _guestName = guestName,
        _hotel = hotel,
        _numberOfNights = numberOfNights,
        _checkInDate = checkInDate,
        _checkOutDate = checkOutDate;
  
      // Getter
        String get bookingId => _bookingId;
        String get userEmail => _userEmail;
        String get guestName => _guestName;
        Hotel get hotel => _hotel;
        int get numberOfNights => _numberOfNights;
        DateTime get checkInDate => _checkInDate; 
        DateTime get checkOutDate => _checkOutDate; 

      // Setter
        set guestName(String value){
          if (value.isNotEmpty){ //isNotEmpty adalah property milik String yang mengecek apakah teks tidak kosong.
            _guestName = value;
          }
        }

        set numberOfNights(int value){
          if (value > 0){
            _numberOfNights = value;
          }
        }
      
      // Method
      double calculateTotalPrice(){
        return _hotel.price * _numberOfNights;
      }
      
      // ungsi untuk menghasilkan Booking ID.
      static String generateBookingId() { //static — method bisa dipanggil langsung dari class Booking, tanpa harus membuat objek terlebih dahulu
        return 'RML-${DateTime.now().millisecondsSinceEpoch}'; //menghasilkan ID unik berdasarkan waktu saat ini dalam milidetik
      }
}