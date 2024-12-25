import 'package:flutter/material.dart';

class PembayaranScreen extends StatelessWidget {
  final List<String> keranjang;
  final int totalHarga;

  const PembayaranScreen({super.key, required this.keranjang, required this.totalHarga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.green.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Rincian Pesanan
            const Text(
              'Rincian Pesanan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 16),
            // Daftar Pesanan
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: keranjang.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        keranjang[index],
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                      ),
                      leading: const Icon(Icons.fastfood, color: Colors.green),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Total Harga
            Text(
              'Total Harga: Rp ${totalHarga.toString()}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 16),
            // Pilih Metode Pembayaran
            const Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // QRIS
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Pembayaran QRIS'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Scan QR Code berikut untuk membayar:'),
                            const SizedBox(height: 10),
                            Image.asset(
                            'assets/barcode3.jpeg', // Menggunakan gambar lokal
                            height: 300,
                            width: 300,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Tutup'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.qr_code, size: 20),
                  label: const Text('QRIS'),
                ),
                // Transfer Bank
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Transfer Bank'),
                        content: const Text('Transfer ke rekening berikut:\n\nBank BNI: 123-456-7890\nAtas Nama: Pecal Lele Sahabat Super'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Tutup'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.account_balance, size: 20),
                  label: const Text('Transfer Bank'),
                ),
                // Cash
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Pembayaran Tunai'),
                        content: const Text('Silakan membayar langsung di kasir.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Tutup'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.money, size: 20),
                  label: const Text('Cash'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Tombol Konfirmasi Pembayaran
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Aksi saat pembayaran berhasil
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Pembayaran Sukses'),
                      content: const Text('Pembayaran Anda berhasil diproses.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                            Navigator.pop(context); // Kembali ke halaman utama
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Konfirmasi Pembayaran',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
