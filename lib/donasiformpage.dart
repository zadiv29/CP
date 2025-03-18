import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BencanaListPage(),
    );
  }
}


class BencanaListPage extends StatelessWidget {
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
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: donasiList.length,
      itemBuilder: (context, index) {
        final item = donasiList[index];
        return InkWell(
          onTap: () {
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
                        Text(
                          item["title"],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(item["name"], style: TextStyle(fontSize: 14, color: Colors.grey)),
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

class DonasiFormPage extends StatelessWidget {
  final Map<String, dynamic> donasi;
  DonasiFormPage({required this.donasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Donasi")),
      body: Center(child: Text("Form Donasi untuk ${donasi['title']}")),
    );
  }
}

class DonasiDetailPage extends StatelessWidget {
  final Map<String, dynamic> donasi;
  DonasiDetailPage({required this.donasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(donasi["title"]),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              donasi["image"],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    donasi["title"],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: donasi["collected"] / donasi["goal"],
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp. ${donasi["collected"]} terkumpul dari Rp. ${donasi["goal"]}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('${donasi["daysLeft"]} hari tersisa', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
