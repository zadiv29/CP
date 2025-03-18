import 'package:flutter/material.dart';
import 'package:cp/bencanalistpage.dart';

class DonasiPage extends StatefulWidget {
  @override
  _DonasiPageState createState() => _DonasiPageState();
}

class _DonasiPageState extends State<DonasiPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      // Kembali ke halaman utama tanpa menumpuk halaman sebelumnya
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Coba cari "Tolong menolong"',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_none, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.person_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Donasi untuk Bersama Melindungi :",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    IconButton(
                      icon: Icon(menuItems[index]['icon'], size: 30, color: Colors.blue),
                      onPressed: () {
                        if (menuItems[index]['route'] != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => menuItems[index]['route'],
                            ),
                          );
                        }
                      },
                    ),
                    Text(menuItems[index]['label'], textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Center(child: Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.grey)),
            SizedBox(height: 20),
            Text("Pilihan Jejak Kebaikan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            PlaceholderGrid(),
            SizedBox(height: 20),
            Text("Program Kolaborasi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            PlaceholderGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Donasi'),
          BottomNavigationBarItem(icon: Icon(Icons.handshake), label: 'Galang Dana'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard), label: 'Donasi Saya'),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> menuItems = [
  {'icon': Icons.nature, 'label': 'Bencana Alam', 'route': BencanaListPage()},
  {'icon': Icons.child_care, 'label': 'Balita & Anak Sakit', 'route': BalitadanAnakSakitPage()},
  {'icon': Icons.local_hospital, 'label': 'Bantuan Medis & Kesehatan', 'route': BantuanMedisdanKesehatanPage()},
  {'icon': Icons.school, 'label': 'Bantuan Pendidikan', 'route': BantuanPendidikanPage()},
  {'icon': Icons.church, 'label': 'Rumah Ibadah', 'route': RumahIbadahPage()},
  {'icon': Icons.groups, 'label': 'Kegiatan Sosial', 'route': KegiatanSosialPage()},
  {'icon': Icons.volunteer_activism, 'label': 'Zakat', 'route': ZakatPage()},
  {'icon': Icons.favorite, 'label': 'Kemanusiaan', 'route': KemanusiaanListPage()},
];

class PlaceholderGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}

// Dummy pages untuk setiap kategori
class BalitadanAnakSakitPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Balita & Anak Sakit'))); }
class BantuanMedisdanKesehatanPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Bantuan Medis & Kesehatan'))); }
class BantuanPendidikanPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Bantuan Pendidikan'))); }
class RumahIbadahPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Rumah Ibadah'))); }
class KegiatanSosialPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Kegiatan Sosial'))); }
class ZakatPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Zakat'))); }
class KemanusiaanListPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Kemanusiaan'))); }
