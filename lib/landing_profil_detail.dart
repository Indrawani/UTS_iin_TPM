import 'package:flutter/material.dart';
import 'package:uts_indrawani_tpm/halaman_utama.dart';
import 'halaman_profil.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Profile'),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue[100],
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/profil.jpg'),
                ),
                SizedBox(height: 16),
                Text(
                  'Email : 123200018@student.upnyk.ac.id',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Nama'),
                  subtitle: Text('Indrawani'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.badge),
                  title: Text('NIM'),
                  subtitle: Text('123200018'),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HalamanProfil(),
                      ),
                    );
                  },
                  child: const Text("Lihat Detail Profil"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}