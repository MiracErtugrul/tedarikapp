import 'package:flutter/material.dart';

class AppliedSuppliesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Geri butonuna basılınca yapılacak işlem
          },
        ),
        title: Text('BAŞVURULAN TEDARİK'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 1; i <= 4; i++)
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: Text('TEDARİK $i', style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      // Tedarik detayına gitme işlemi
                    },
                  ),
                  Divider(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
