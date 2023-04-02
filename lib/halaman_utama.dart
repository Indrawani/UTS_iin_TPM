import 'package:flutter/material.dart';
import 'package:uts_indrawani_tpm/bangun_datar.dart';
import 'kalender_page.dart';
import 'landing_profil_detail.dart';
import 'login_page.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu Utama"),
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
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png',
                    width: 180,
                    height: 180,
                  ),
                  Text(
                    'Selamat Datang di Aplikasi UTS',
                    style: TextStyle(fontSize: 25),
                  ),
                  buttonBangunDatar(context),
                  buttonKalender(context),
                  buttonProfil(context),
                ]),
          ),
        ]),
      ),
    );
  }
}

Widget buttonBangunDatar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 35),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return HalamanBangunDatar();
              }));
        },
        child: const Text('Get Start Bangun Datar'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}

Widget buttonKalender(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60, top: 0),
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return const KalenderPage();
              }));
        },
        child: const Text('Get Start Kalender'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
      ),
    ),
  );
}

  Widget buttonProfil(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0, left: 60, right: 60, top: 0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return  ProfilePage();
                }));
          },
          child: const Text('Get Start Profil'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(40),
          ),
        ),
      ),
    );
}