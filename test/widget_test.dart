import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cp/main.dart';

void main() {
  testWidgets('Menampilkan halaman utama dengan benar', (WidgetTester tester) async {
    // Bangun aplikasi dan render tampilan pertama
    await tester.pumpWidget(MyApp());

    // Pastikan AppBar dengan kolom pencarian muncul
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    // Pastikan carousel slider ada
    expect(find.byType(Image), findsWidgets); // Karena ada beberapa gambar di slider

    // Pastikan tombol menu muncul
    expect(find.text('Donasi'), findsOneWidget);
    expect(find.text('Zakat'), findsOneWidget);
    expect(find.text('Galang Dana'), findsOneWidget);
    expect(find.text('Donasi Otomatis'), findsOneWidget);
    expect(find.text('Voluntrip'), findsOneWidget);
    expect(find.text('Kolaborasi CSR'), findsOneWidget);
    expect(find.text('Saling Jaga'), findsOneWidget);
    expect(find.text('Lainnya'), findsOneWidget);

    // Pastikan ada BottomNavigationBar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
