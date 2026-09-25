import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/hotel.dart';
import '../models/booking.dart';

class HotelDetailScreen extends StatefulWidget{ //StatelessWidget cocok kalau tampilan tidak punya data yang berubah selama screen digunakan.
  final Hotel hotel; //Menyimpan data hotel yang dipilih.

  const HotelDetailScreen({
    super.key,
    required this.hotel, //setiap kali membuka detail, kita wajib mengirim data hotel.
  });
  
 @override
  State<HotelDetailScreen>  //Ini adalah return type. Artinya method tersebut harus mengembalikan sebuah object State yang berhubungan dengan HotelDetailScreen.
    createState() //ini nama method yang dipanggil Flutter untuk mendapatkan State dari widget kita.
      => _HotelDetailScreenState(); //arrow syntax untuk return satu expression.
  }

  class _HotelDetailScreenState extends State<HotelDetailScreen> { //State yang menyimpan data yang bisa berubah untuk HotelDetailScreen.
    int _numberOfNights = 1;

    final TextEditingController _guestNameController =  //TextEditingController : Controller ini digunakan untuk mengambil dan mengontrol isi dari TextField.
      TextEditingController();

  get color => null; //default-nya 1 malam.

    @override
    Widget build(BuildContext context){
      final priceFormat = NumberFormat('#,###', 'id_ID');
      final booking = Booking( //Buat object Booking
        guestName: _guestNameController.text, //Controller tersebut menyimpan hubungan dengan TextField.
        hotel: widget.hotel,
        numberOfNights: _numberOfNights,
      );

      return Scaffold(
        backgroundColor: const Color(0xFFF8F7F3),

        appBar: AppBar(
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.hotel.name, //Ambil hotel milik HotelDetailScreen, kemudian ambil name dari object Hotel tersebut.
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect( //memotong bentuk widget mengikuti sudut yang kita tentukan.
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: Image.network(
                    widget.hotel.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // INFORMASI HOTEL
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                  maxWidth: 1200,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hotel.name,
                        style: const TextStyle(
                          color: Color(0xFF0F172A),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),

                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFF64748B),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.hotel.location,
                            style: const TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline, //teks disejajarkan berdasarkan garis dasar tulisan.
                        textBaseline: TextBaseline.alphabetic, //Flutter menggunakan baseline yang sesuai dengan teks alfabet.
                        children: [
                          Text(
                            'Rp ${priceFormat.format(widget.hotel.price)}',
                            style: const TextStyle(
                              color: Color(0xFFC9A227),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 6),
                          
                          const Text(
                            '/ malam',
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF8E1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFC9A227),
                            ),
                            const SizedBox(width: 6),

                            Text(
                              '${widget.hotel.rating}',
                              style: const TextStyle(
                                color: Color(0xFF0F172A),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                            ),
                            ),  
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      const Text(
                        'Deskripsi Hotel',
                        style: TextStyle(
                          color: Color(0xFF0F172A),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      const Text(
                        'Nikmati pengalaman menginap yang nyaman '
                        'dan mewah bersama Roomly. Hotel ini menyediakan '
                        'fasilitas terbaik untuk membuat perjalananmu '
                        'menjadi lebih menyenangkan.',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Nama Tamu
                      const Text(
                        'Nama Tamu',
                        style: TextStyle(
                          color: Color(0xFF0F172A),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      TextField(
                        controller: _guestNameController, //TextField dan controller terhubung.
                        decoration: InputDecoration( //InputDecoration untuk menentukan hint, warna background, border, dan sebagainya.
                          hintText: 'Masukkan nama tamu', //ni adalah teks petunjuk yang muncul ketika field masih kosong.
                          filled: true, //filled: true memberi tahu Flutter bahwa kita ingin memberikan warna isi/background pada field.
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none, //border garisnya tidak ditampilkan.
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        children: [
                          const Text(
                            'Jumlah malam',
                            style: TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),

                          // tombol kurang
                          IconButton(
                            onPressed: (){
                              if (_numberOfNights > 1){
                                setState(() {
                                  _numberOfNights--;
                                });
                              }
                            },
                            icon: const Icon(Icons.remove),
                          ),

                          Text(
                            '$_numberOfNights',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // tombol tambah
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _numberOfNights++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      Text(
                        'Total Harga',
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),

                      Text(
                        'Rp ${priceFormat.format(booking.calculateTotalPrice())}',
                        style: const TextStyle(
                          color: Color(0xFFC9A227),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // TOMBOL PESAN
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_guestNameController.text.isEmpty){ //.isEmpty adalah property untuk mengecek apakah String tidak memiliki karakter.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Nama tamu wajib disini.'
                                  ),
                                ),
                              );
                              return;
                            }

                            final booking = Booking(
                              guestName: _guestNameController.text, //Controller tersebut menyimpan hubungan dengan TextField.
                              hotel: widget.hotel,
                              numberOfNights: _numberOfNights,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Booking berhasil untuk ${booking.guestName}! '
                                  'Total: Rp ${priceFormat.format(booking.calculateTotalPrice())}',
                                ),
                              ),
                            );
                          }, 
                          
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC9A227),
                            foregroundColor: const Color(0xFF0F172A),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'PESAN SEKARANG',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ],
          ),
          
        ),
      );
    }
}