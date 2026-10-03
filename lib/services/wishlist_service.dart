import '../models/hotel.dart';

class WishlistService{
  final List<Hotel> _wishlist = []; //kita bisa menggunakan list untuk menyimpan data hotel yang diinginkan pengguna

  void addToWishlist(Hotel hotel){
    _wishlist.add(hotel); //menambahkan hotel ke dalam wishlist
  }

  void removeFromWishlist(Hotel hotel){
    _wishlist.remove(hotel); //menghapus hotel dari wishlist
  }

  List<Hotel> get wishlist => _wishlist; //mengembalikan daftar hotel yang ada di wishlist
}

final wishlistService = WishlistService(); //membuat instance dari WishlistService untuk digunakan di seluruh aplikasi