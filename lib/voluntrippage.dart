import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VoluntripPage extends StatefulWidget {
  @override
  _VoluntripPageState createState() => _VoluntripPageState();
}

class _VoluntripPageState extends State<VoluntripPage> {
  bool isVolunteerOpen = false;
  final ImagePicker _picker = ImagePicker();
  List<Map<String, dynamic>> volunteerList = [
    {
      'title': 'Volunteer Iftar Jamai',
      'image': File(''), // Default kosong
      'description': 'Membantu kegiatan ifthar jamai di Pondok Pesantren Albinaa',
      'volunteerCount': '12 Volunteer',
      'status': '-'
    }
  ];

  Future<void> addVolunteer() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        volunteerList.add({
          'title': 'Volunteer Baru',
          'image': File(pickedFile.path),
          'description': 'Kegiatan volunteer baru yang ditambahkan pengguna',
          'volunteerCount': '0 Volunteer',
          'status': '-'
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Voluntrip'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                title: Text('Open For Volunteer', style: TextStyle(fontWeight: FontWeight.bold)),
                value: isVolunteerOpen,
                onChanged: (value) {
                  setState(() {
                    isVolunteerOpen = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text("Volunteer Dibutuhkan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ...volunteerList.map((volunteer) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                        child: volunteer['image'].path.isNotEmpty
                            ? Image.file(volunteer['image'], width: double.infinity, height: 150, fit: BoxFit.cover)
                            : Container(height: 150, color: Colors.grey[300]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(volunteer['title'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(volunteer['description'], style: TextStyle(color: Colors.grey[600])),
                            SizedBox(height: 5),
                            Text("Jumlah Volunteer: ${volunteer['volunteerCount']}"),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: addVolunteer,
                icon: Icon(Icons.add_a_photo),
                label: Text('Tambah Volunteer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
