import '../models/review.dart';

class ReviewService {
  final List<Review> _reviews = []; // Menyimpan daftar review yang telah ditambahkan.

  void addReview(Review review) {
    _reviews.add(review); // Menambahkan review baru ke dalam daftar _reviews.
  }

  List<Review> get reviews => _reviews; // Mengembalikan daftar review yang telah ditambahkan.

}

final reviewService = ReviewService(); // Membuat instance dari ReviewService untuk digunakan di seluruh aplikasi.