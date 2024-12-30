import 'package:flutter/material.dart';
import '../services/database_service.dart';

class SharePage extends StatefulWidget {
  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  final DatabaseService _databaseService = DatabaseService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tedarik Paylaşma'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Ürünün Adı'),
            ),
            TextField(
              controller: _sectorController,
              decoration: InputDecoration(labelText: 'Kullanım Alanı'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Detaylı Açıklama'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  print('Paylaş butonuna basıldı');
                  print('Ad: ${_nameController.text}');
                  print('Sektör: ${_sectorController.text}');
                  print('Açıklama: ${_descriptionController.text}');
                  await _databaseService.addSupply(
                    _nameController.text,
                    _sectorController.text,
                    _descriptionController.text,
                  );
                  print('Veri Firestore\'a eklendi');
                  Navigator.pop(context);
                } catch (e) {
                  print('Hata: $e');
                }
              },
              child: Text('Paylaş'),
            ),
          ],
        ),
      ),
    );
  }
}

