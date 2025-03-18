import 'package:flutter/material.dart';
import 'package:cp/donasiformpage.dart';

class BencanaListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bencana Alam')),
      body: DonasiListPage(),
    );
  }
}

class DonasiListPage extends StatelessWidget {
  final List<Map<String, dynamic>> donasiList = [
    {
      "image": "assets/list1.png",
      "title": "TOLONG NAILA LAWAN KANKER DARAH",
      "name": "Megi Astuti",
      "verified": true,
      "collected": 46240229,
      "goal": 100000000,
      "daysLeft": 66,
      "recommended": true,
    },
    {
      "image": "assets/banner2.png",
      "title": "DARURAT! Fungsi Ginjal Ichel Tinggal 37%",
      "name": "Wendy Santoso",
      "verified": true,
      "collected": 493244246,
      "goal": 700000000,
      "daysLeft": 40,
    },
    {
      "image": "assets/banner3.png",
      "title": "Bantu Semangat Rafif Lawan Sakit Jantung",
      "name": "Sahabat Gotong Royong",
      "verified": false,
      "collected": 158000,
      "goal": 5000000,
      "daysLeft": 2,
    },
    {
      "image": "assets/list4.png",
      "title": "Jangan sampai aku berhenti kemo rutin",
      "name": "Yayasan Sambung Silaturahmi Bekasi",
      "verified": false,
      "collected": 609000,
      "goal": 10000000,
      "daysLeft": 2,
    },
    {
      "image": "assets/list5.png",
      "title": "Idap PDA, Pengobatan Hadziqa Terhenti",
      "name": "Sahabat Berbagi",
      "verified": true,
      "collected": 2518000,
      "goal": 10000000,
      "daysLeft": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: donasiList.length,
      itemBuilder: (context, index) {
        final item = donasiList[index];
        return InkWell(
          onTap: () {
            // Jika item tertentu ingin diarahkan ke halaman form donasi
            if (item["title"] == "TOLONG NAILA LAWAN KANKER DARAH") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DonasiFormPage(donasi: item),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DonasiDetailPage(donasi: item),
                ),
              );
            }
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item["image"],
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (item["recommended"] ?? false)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "REKOMENDASI",
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        SizedBox(height: 5),
                        Text(
                          item["title"],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              item["name"],
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            if (item["verified"])
                              Icon(Icons.verified, color: Colors.blue, size: 16),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: item["collected"] / item["goal"],
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Terkumpul Rp${item["collected"].toString().replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => "${m[1]}.",
                              )} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sisa hari ${item["daysLeft"]}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DonasiDetailPage extends StatelessWidget {
  final Map<String, dynamic> donasi;

  DonasiDetailPage({required this.donasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(donasi["title"])),
      body: Center(
        child: Text("Detail Donasi: ${donasi["title"]}"),
      ),
    );
  }
}
