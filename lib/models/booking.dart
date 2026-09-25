import 'hotel.dart';

class Booking {
  String _guestName;
  Hotel _hotel;
  int _numberOfNights;

  Booking({
    required String guestName,
    required Hotel hotel,
    required int numberOfNights,
  })  : _guestName = guestName,
        _hotel = hotel,
        _numberOfNights = numberOfNights;
  
      // Getter
        String get guestName => _guestName;
        Hotel get hotel => hotel;
        int get numberOfNights => numberOfNights;

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
}