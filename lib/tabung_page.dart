import 'package:flutter/material.dart';
import 'dart:math';

import 'login_page.dart';

class TabungPage extends StatefulWidget {
  const TabungPage({Key? key}) : super(key: key);

  @override
  State<TabungPage> createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  TextEditingController jariJariController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();

  int luas = 0;
  int keliling = 0;

  void hitung() {
    double jariJari = double.tryParse(jariJariController.text) ?? 0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0;

    luas = (2 * pi * jariJari * (jariJari + tinggi)).toInt();
    keliling = (2 * pi * jariJari + 2 * pi * jariJari * tinggi).toInt();

        setState(() {});
      }
      void reset() {
        jariJariController.text = '';
        tinggiController.text = '';
        luas = 0;
        keliling = 0;
        setState(() {});
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabung'),
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
                'images/tabung.png',
                width: 200,
                height: 200,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: jariJariController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jari-jari',
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
      const SizedBox(height: 16),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Luas        : ${luas}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Keliling   : ${keliling}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}
