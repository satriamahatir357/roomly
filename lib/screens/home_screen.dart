import 'package:flutter/material.dart'; //mengambil library Flutter.

// membuat widget halaman Home.
class HomeScreen extends StatelessWidget { //widget yang tidak memiliki state yang berubah.
    const HomeScreen({super.key}); 
    
    @override
    Widget build(BuildContext context) { //menentukan tampilan widget.
        return Scaffold( //kerangka dasar halaman.
            appBar: AppBar( //bagian header atas.
                title: const Text('Roomly'),
            ),
            body: const Center( //menempatkan isi di tengah.
                child: Text('Welcome to Roomly'),
            ),
        );
    }
}