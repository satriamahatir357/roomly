import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/hotel.dart';
import '../models/booking.dart';
import 'booking_summary_screen.dart';
import '../data/review_data.dart';
import '../models/review.dart';
import '../services/review_service.dart';
import '../services/user_service.dart';

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
    int _numberOfNights = 1; //Variabel ini menyimpan jumlah malam yang dipilih oleh pengguna. Default-nya 1 malam.
    DateTime _checkInDate = DateTime.now(); //Variabel ini menyimpan tanggal check-in yang dipilih pengguna. Nilai awalnya adalah hari ini.
    int _selectedRating = 0;//Variabel ini menyimpan rating yang dipilih oleh pengguna. Default-nya 0 (belum ada rating).

    final TextEditingController _guestNameController =  //TextEditingController : Controller ini digunakan untuk mengambil dan mengontrol isi dari TextField.
      TextEditingController();
    
    final TextEditingController _reviewController = //TextEditingController(); //Controller ini digunakan untuk mengambil dan mengontrol isi dari TextField untuk review.
    TextEditingController();

    //membersihkan resource yang dipakai TextEditingController ketika halaman HotelDetailScreen sudah ditutup
    @override
    void dispose() {
      _guestNameController.dispose(); //membersihkan controller nama tamu.
      _reviewController.dispose(); //membersihkan controller review.
      super.dispose(); //memanggil method dispose() dari superclass (State) untuk membersihkan resource yang digunakan oleh State.
    }

    @override
    Widget build(BuildContext context){
      final priceFormat = NumberFormat('#,###', 'id_ID');

      final hotelReviews = [ //Membuat daftar review untuk hotel yang sedang ditampilkan.
        ...reviews,//Mengambil semua review dari daftar review yang ada di review_data.dart.
        ...reviewService.reviews,
      ].where((review) {
        return review.hotel == widget.hotel;
      }).toList();

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

                      const Text(
                        'Tanggal Check-in',
                        style: TextStyle(
                          color: Color(0xFF0F172A),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () async { //async menandakan bahwa fungsi tersebut bisa menggunakan await untuk menunggu proses asinkron.
                          final selectedDate = await showDatePicker( //await menunggu pengguna selesai memilih tanggal. showDatePicker() membuka kalender untuk memilih tanggal.
                            context: context,
                            initialDate: _checkInDate, //menentukan tanggal yang awalnya terpilih
                            firstDate: DateTime.now(), //firstDate membatasi agar pengguna tidak memilih tanggal sebelum hari ini.
                            lastDate: DateTime.now().add( //lastDate membatasi pilihan hingga satu tahun dari hari ini.
                              const Duration(days: 365),
                            ),
                          );

                          if (selectedDate != null) { //memastikan tanggal tidak berubah jika pengguna membatalkan kalender.
                            setState(() {
                              _checkInDate = selectedDate;
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1EFE8),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFE2E8F0),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Color(0xFFC9A227),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  '${_checkInDate.day.toString().padLeft(2, '0')}/'
                                  '${_checkInDate.month.toString().padLeft(2, '0')}/'
                                  '${_checkInDate.year}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.edit_calendar_outlined,
                                color: Color(0xFF64748B),
                              ),
                            ],
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
                        'Rp ${priceFormat.format(widget.hotel.price * _numberOfNights)}',
                        style: const TextStyle(
                          color: Color(0xFFC9A227),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      //Ulasan Tamu
                      const Text(
                        'Beri Rating',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: List.generate(5, (index) { //List.generate membuat daftar widget IconButton sebanyak 5 kali, dengan index dari 0 hingga 4.
                          final rating = index + 1;

                          return IconButton(
                            onPressed: () {
                              setState(() {
                                if (_selectedRating == rating) {
                                  _selectedRating = 0;
                                } else {
                                  _selectedRating = rating;
                                }
                              });
                            },
                            icon: Icon(
                              rating <= _selectedRating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: const Color(0xFFC9A227),
                              size: 32,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: _reviewController, //Controller ini digunakan untuk mengambil dan mengontrol isi dari TextField untuk review.
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Tulis ulasan kamu...',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFE2E8F0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_selectedRating == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Silakan pilih rating terlebih dahulu.'),
                                ),
                              );
                              return;
                            }

                            if (_reviewController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Silakan tulis ulasan terlebih dahulu.'),
                                ),
                              );
                              return;
                            }

                            reviewService.addReview(
                              Review(
                                userName: userService.currentUser?.name ?? 'User',
                                hotel: widget.hotel,
                                rating: _selectedRating.toDouble(),
                                comment: _reviewController.text.trim(),
                              ),
                            );

                            if (!mounted) return;//mounted adalah property dari State yang menunjukkan apakah State masih terpasang di widget tree. Jika tidak, kita tidak boleh memanggil setState() karena akan menyebabkan error.

                            _reviewController.clear(); //membersihkan isi TextField

                            setState(() {
                              _selectedRating = 0; //memberi tahu Flutter bahwa rating berubah, sehingga bintang digambar ulang.
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F172A),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Kirim Review',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      // tampilkan review
                      if (hotelReviews.isNotEmpty) ...[ //Jika hotelReviews tidak kosong, maka tampilkan daftar review.
                        const SizedBox(height: 32),

                        const Text(
                          'Ulasan Tamu',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),

                        const SizedBox(height: 16),

                        ...hotelReviews.map( //Gunakan map untuk mengubah setiap review menjadi widget Card.
                          (review) => Card( //review adalah parameter dari fungsi map, yang merepresentasikan setiap elemen dalam hotelReviews.
                            // kode Card review kamu yang sekarang
                            color: Colors.white,
                            elevation: 0,
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review.userName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0F172A),
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFC9A227),
                                        size: 18,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        review.rating.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF64748B),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    review.comment,
                                    style: const TextStyle(
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]
                      else ...[
                        const SizedBox(height: 32),

                        const Text(
                          'Belum ada ulasan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // TOMBOL PESAN
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_guestNameController.text.trim().isEmpty){ //input yang hanya berisi spasi juga dianggap kosong.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Nama tamu wajib disini.'
                                  ),
                                ),
                              );
                              return;
                            }
                            
                            final checkInDate = _checkInDate; //_checkInDate menyimpan tanggal yang dipilih pengguna. checkOutDate otomatis menghitung tanggal keluar dari tanggal check-in ditambah jumlah malam. 

                            final checkOutDate = checkInDate.add( //.add(Duration(days: _numberOfNights)) menambahkan jumlah hari sesuai lama menginap.
                              Duration(days: _numberOfNights),
                            );

                            final booking = Booking(
                              bookingId: Booking.generateBookingId(),
                              userEmail: userService.currentUser!.email,
                              guestName: _guestNameController.text.trim(),
                              hotel: widget.hotel,
                              numberOfNights: _numberOfNights,
                              checkInDate: checkInDate,
                              checkOutDate: checkOutDate,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingSummaryScreen(
                                  booking: booking,
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