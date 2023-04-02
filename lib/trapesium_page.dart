import 'package:flutter/material.dart';
import 'dart:math';

import 'login_page.dart';

class TrapesiumPage extends StatefulWidget {
  const TrapesiumPage({Key? key}) : super(key: key);

  @override
  State<TrapesiumPage> createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  TextEditingController sisiAtasController = TextEditingController();
  TextEditingController sisiBawahController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();

  double luas = 0;
  int keliling = 0;

  void hitung() {
    double sisiAtas = double.tryParse(sisiAtasController.text) ?? 0;
    double sisiBawah = double.tryParse(sisiBawahController.text) ?? 0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0;

    luas = ((sisiAtas + sisiBawah) * tinggi) / 2;

    double miring = sqrt(pow((sisiBawah - sisiAtas) / 2, 2) + pow(tinggi, 2));
    keliling = (sisiAtas + sisiBawah + (2 * miring)).toInt();

    setState(() {});
  }


  void reset() {
    sisiAtasController.text = '';
    sisiBawahController.text = '';
    tinggiController.text = '';
    luas = 0;
    keliling = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trapesium'),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Image.asset(
                'images/trapesium.png',
                width: 200,
                height: 200,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: sisiAtasController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Sisi atas',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: sisiBawahController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Sisi bawah',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: tinggiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Tinggi',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: hitung,
                child: const Text('Hitung'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: reset,
                child: const Text('Reset'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                ),
              ),
            ],
          ),
      const SizedBox(height: 20),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Luas     : $luas',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Keliling : $keliling',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}