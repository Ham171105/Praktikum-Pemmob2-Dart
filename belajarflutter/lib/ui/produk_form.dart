import 'package:flutter/material.dart';
import 'produk_detail.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({super.key});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  void dispose() {
    _kodeProdukController.dispose();
    _namaProdukController.dispose();
    _hargaProdukController.dispose();
    super.dispose();
  }

  Widget _textboxKodeProduk() {
    return TextField(
      controller: _kodeProdukController,
      decoration: const InputDecoration(
        labelText: 'Kode Produk',
      ),
    );
  }

  Widget _textboxNamaProduk() {
    return TextField(
      controller: _namaProdukController,
      decoration: const InputDecoration(
        labelText: 'Nama Produk',
      ),
    );
  }

  Widget _textboxHarga() {
    return TextField(
      controller: _hargaProdukController,
      decoration: const InputDecoration(
        labelText: 'Harga',
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        final kode = _kodeProdukController.text;
        final nama = _namaProdukController.text;
        final harga = int.tryParse(_hargaProdukController.text) ?? 0;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              kodeProduk: kode,
              namaProduk: nama,
              hargaProduk: harga,
            ),
          ),
        );
      },
      child: const Text('Simpan'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _textboxKodeProduk(),
              const SizedBox(height: 16),
              _textboxNamaProduk(),
              const SizedBox(height: 16),
              _textboxHarga(),
              const SizedBox(height: 32),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }
}
