import 'package:flutter/material.dart';
import 'hello_world.dart';
import 'column_widget.dart';
import 'row_widget.dart';
import 'ui/produk_form.dart';
import 'ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 2 Pemrograman Mobile',
      theme: ThemeData(
        useMaterial3: false, // Membuat AppBar biru penuh persis punya temanmu & modul
        primarySwatch: Colors.blue,
      ),
      // Ganti baris home di bawah ini kalau mau ambil screenshot halaman lain:
      // home: const HelloWorld(),
      // home: const ColumnWidget(),
      // home: const RowWidget(),
      // home: const ProdukForm(),
      home: const ProdukPage(),
    );
  }
}