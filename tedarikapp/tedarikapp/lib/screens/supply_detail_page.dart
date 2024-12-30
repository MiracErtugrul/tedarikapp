import 'package:flutter/material.dart';

class SupplyDetailPage extends StatelessWidget {
  final int index;

  SupplyDetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tedarik Detayı ${index + 1}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tedarik ile ilgili resim
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/supply_image.png'), // Buraya resmin yolu gelecek
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tedarik Detayları',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ürünün Adı',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Kullanım Alanı',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Detaylı Açıklama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.attach_file),
                SizedBox(width: 8),
                Text('Dosya Eki'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}