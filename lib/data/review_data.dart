import '../models/review.dart';
import 'hotel_data.dart';

final List<Review> reviews = [ // Daftar review yang telah ditambahkan ke dalam aplikasi.
  Review(
    userName: 'Andi',
    hotel: hotels[0],
    rating: 5,
    comment: 'Hotelnya nyaman dan pelayanannya bagus.',
  ),
  Review(
    userName: 'Sinta',
    hotel: hotels[1],
    rating: 4.5,
    comment: 'Kamarnya bersih dan suasananya sangat nyaman.',
  ),
  Review(
    userName: 'Budi',
    hotel: hotels[2],
    rating: 4,
    comment: 'Lokasinya strategis dan harga cukup terjangkau.',
  ),
];