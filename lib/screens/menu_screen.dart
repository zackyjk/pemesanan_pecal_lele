import 'package:flutter/material.dart';
import 'pembayaran_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> menu = [
    'Ayam Bakar', 'Ayam Goreng', 'Lele Goreng', 'Lele Bakar', 'Ikan Nila Bakar',
    'Cah Kangkung', 'Nasi Uduk', 'Nasi Biasa', 'Es Kosong', 'Es Teh', 'Sirup'
  ];
  final List<int> harga = [
    15000, 15000, 13000, 13000, 17000, 12000, 6000, 5000, 2000, 5000, 6000
  ];
  int totalHarga = 0;
  List<String> keranjang = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Pecal Lele Sahabat Super'),
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade50, Colors.green.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5,
              shadowColor: Colors.green[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  menu[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),
                subtitle: Text(
                  'Rp ${harga[index]}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      keranjang.add(menu[index]);
                      totalHarga += harga[index];
                    });
                  },
                  child: const Text(
                    'Pesan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[100],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: Rp $totalHarga',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Warna tombol keranjang
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PembayaranScreen(
                        keranjang: keranjang,
                        totalHarga: totalHarga,
                      ),
                    ),
                  );
                },
                child: const Text('Keranjang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
