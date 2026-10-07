import 'hotel.dart';

class Review {
  String _userName;
  Hotel _hotel;
  double _rating;
  String _comment;

  Review({
    required String userName,
    required Hotel hotel,
    required double rating,
    required String comment,
  })  : _userName = userName,
        _hotel = hotel,
        _rating = rating,
        _comment = comment;

  // getter
  String get userName => _userName;
  Hotel get hotel => _hotel;
  double get rating => _rating;
  String get comment => _comment;

  set userName(String value) {
    if (value.isNotEmpty) { //jika nilai userName tidak kosong, maka akan di set ke _userName.
      _userName = value;
    }
  }

  set rating(double value) {
    if (value >= 1 && value <= 5) {
      _rating = value;
    }
  }

  set comment(String value) {
    if (value.isNotEmpty) {
      _comment = value;
    }
  }
}