import 'package:flutter/material.dart';
import 'package:uts_indrawani_tpm/tabung_page.dart';
import 'package:uts_indrawani_tpm/trapesium_page.dart';
import 'halaman_utama.dart';
import 'login_page.dart';

class HalamanBangunDatar extends StatefulWidget {
  const HalamanBangunDatar({Key? key}) : super(key: key);

  @override
  _HalamanBangunDatarState createState() => _HalamanBangunDatarState();
}

class _HalamanBangunDatarState extends State<HalamanBangunDatar> {
  int selectedCard = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bangun Datar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const HalamanUtama();
              }),
                  (route) => false,
            );
          },
        ),
        actions: [
          Row(
            children: [
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Logout',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }),
                        (route) => false,
                  );
                },
              ),
            ],
          ),
        ],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Menu Bangun datar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Pilih Salah Satu Untuk Melakukan Perhitungan',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                setState(() {
                  selectedCard = 0;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const TrapesiumPage();
                  }),
                ).then((value) {
                  setState(() {
                    selectedCard = -1;
                  });
                });
              },
              child: Card(
                color: selectedCard == 0 ? Colors.blue : Colors.white,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/trapesium.png',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(width: 16),
                      const Text('Trapesium'),
                      const Spacer(),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                setState(() {
                  selectedCard = 1;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const TabungPage();
                  }),
                ).then((value) {
                  setState(() {
                    selectedCard = -1;
                  });
                });
              },
              child: Card(
                color: selectedCard == 1 ? Colors.blue : Colors.white,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/tabung.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(width: 16),
                      const Text('Tabung'),
                      const Spacer(),
                      const Icon(Icons.arrow_forward),
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