import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    DonasiPage(),
    GalangDanaPage(),
    HomePage(),
    DonasiSayaPage(),
    InboxPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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

class HomePage extends StatelessWidget {
  final List<String> bannerImages = [
    'assets/banner1.png',
    'assets/banner2.png',
  ];

  final List<String> donasiImages = [
    'assets/bannerhome1.png',
    'assets/bannerhome2.png',
  ];

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.favorite, 'label': 'Donasi', 'route': DonasiPage()},
    {'icon': Icons.money, 'label': 'Zakat', 'route': ZakatPage()},
    {'icon': Icons.handshake, 'label': 'Galang Dana', 'route': GalangDanaPage()},
    {'icon': Icons.autorenew, 'label': 'Donasi Otomatis', 'route': DonasiOtomatisPage()},
    {'icon': Icons.volunteer_activism, 'label': 'Voluntrip', 'route': VoluntripPage()},
    {'icon': Icons.business, 'label': 'Kolaborasi CSR', 'route': KolaborasiCSRPage()},
    {'icon': Icons.shield, 'label': 'Saling Jaga', 'route': SalingJagaPage()},
    {'icon': Icons.more_horiz, 'label': 'Lainnya', 'route': LainnyaPage()},
  ];

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
          IconButton(icon: Icon(Icons.favorite), onPressed: () => navigateTo(context, DonasiPage())),
          IconButton(icon: Icon(Icons.mail), onPressed: () => navigateTo(context, InboxPage())),
          IconButton(icon: Icon(Icons.person), onPressed: () => navigateTo(context, ProfilePage())),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(height: 150.0, autoPlay: true, autoPlayInterval: Duration(seconds: 5)),
              items: bannerImages.map((imagePath) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            _buildDompetSection(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
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
                        onPressed: () => navigateTo(context, menuItems[index]['route']),
                      ),
                      Text(menuItems[index]['label'], style: TextStyle(fontSize: 12)),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Pilihan Donasi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                enlargeCenterPage: true,
              ),
              items: donasiImages.map((imagePath) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDompetSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance_wallet, color: Colors.orange),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("****", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Kantong Donasimu"),
                  ],
                ),
              ],
            ),
            VerticalDivider(color: Colors.grey),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.shield, color: Colors.orange),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Saling Jaga", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Aktifkan Sekarang!", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
// Placeholder pages
class DonasiPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Donasi'))); }
class ZakatPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Zakat'))); }
class GalangDanaPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Galang Dana'))); }
class DonasiSayaPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Donasi Saya'))); }
class InboxPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Inbox'))); }
class ProfilePage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Profile'))); }
class LainnyaPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Lainnya'))); }
class DonasiOtomatisPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Donasi Otomatis'))); }
class VoluntripPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Voluntrip'))); }
class KolaborasiCSRPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('CSR'))); }
class SalingJagaPage extends StatelessWidget { Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Saling Jaga'))); }
