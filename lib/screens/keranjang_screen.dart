import 'package:flutter/material.dart';
import 'pembayaran_screen.dart';

class KeranjangScreen extends StatelessWidget {
  final List<String> keranjang;

  const KeranjangScreen({Key? key, required this.keranjang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: ListView.builder(
        itemCount: keranjang.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(keranjang[index]),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PembayaranScreen(
                  keranjang: keranjang,
                  totalHarga: keranjang.length * 15000,  // totalHarga sementara
                ),
              ),
            );
          },
          child: const Text('Pembayaran'),
        ),
      ),
    );
  }
}
