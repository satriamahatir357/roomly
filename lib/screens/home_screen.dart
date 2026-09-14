import 'package:flutter/material.dart'; //mengambil library Flutter.

// membuat widget halaman Home.
class HomeScreen extends StatelessWidget { //widget yang tidak memiliki state yang berubah.
    const HomeScreen({super.key}); //Constructor
    
    @override
    Widget build(BuildContext context) { //menentukan tampilan widget.
        return Scaffold( //kerangka dasar halaman.
            appBar: AppBar( //bagian header atas.
                title: const Text('Roomly'),
                centerTitle: true,
                actions: [ //daftar widget yang ditampilkan di sisi kanan AppBar
                    TextButton(
                        onPressed: () {}, //tombol sudah bisa ditekan, tetapi belum melakukan apa-apa
                        child: const Text('Home'),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Hotels'),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('About'),
                    ),
                    const SizedBox(width: 16,), //untuk memberikan ukuran atau jarak
                ],
            ),
            body: const Center( //menempatkan isi di tengah.
                child: Text('Welcome to Roomly'),
            ),
        );
    }
}