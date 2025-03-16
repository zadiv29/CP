import 'package:flutter/material.dart';

class DonasiSayaPage extends StatelessWidget {
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
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: Icon(Icons.mail), onPressed: () {}),
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Donasi untuk Bersama Melindungi :",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildDonationCategories(),
              SizedBox(height: 20),
              Center(child: Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.blue)),
              SizedBox(height: 20),
              Text(
                "Pilihan Jejak Kebaikan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildDonationCards(),
              SizedBox(height: 20),
              Text(
                "Program Kolaborasi",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildDonationCards(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 3, // Indeks Donasi Saya
        onTap: (index) {
          // Tambahkan navigasi ke halaman lain jika perlu
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

  // Widget untuk kategori donasi
  Widget _buildDonationCategories() {
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.nature, 'label': 'Bencana Alam'},
      {'icon': Icons.child_care, 'label': 'Balita & Anak Sakit'},
      {'icon': Icons.local_hospital, 'label': 'Bantuan Medis & Kesehatan'},
      {'icon': Icons.school, 'label': 'Bantuan Pendidikan'},
      {'icon': Icons.mosque, 'label': 'Rumah Ibadah'},
      {'icon': Icons.people, 'label': 'Kegiatan Sosial'},
      {'icon': Icons.money, 'label': 'Zakat'},
      {'icon': Icons.public, 'label': 'Kemanusiaan'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              radius: 25,
              child: Icon(categories[index]['icon'], color: Colors.blue),
            ),
            SizedBox(height: 5),
            Text(
              categories[index]['label'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        );
      },
    );
  }

  // Widget untuk kartu donasi
  Widget _buildDonationCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _donationCard(),
        _donationCard(),
      ],
    );
  }

  Widget _donationCard() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
