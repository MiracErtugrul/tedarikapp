import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_page.dart'; // Profil sayfası için ilgili dosyayı import edin
import 'supply_detail_page.dart'; // SupplyDetailPage sayfasını import edin
import '../services/database_service.dart'; // DatabaseService'i import edin

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService();
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode(); // Klavye için FocusNode

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _showMenu() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                // Profil sayfasına git
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()), // Profil sayfasına yönlendir
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Kategoriler'),
              onTap: () {
                print('Kategoriler tıklandı');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.filter_list),
              title: Text('Filtrele'),
              onTap: () {
                print('Filtrele tıklandı');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.sort),
              title: Text('Sırala'),
              onTap: () {
                print('Sırala tıklandı');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.more_horiz),
              title: Text('Diğer'),
              onTap: () {
                print('Diğer tıklandı');
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Geri tuşunu kaldırır
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // İkonları sağa ve sola yaslar
          children: [
            // Arama butonunu ve arama kutusunu birleştiriyoruz
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _searchController,
                  focusNode: _focusNode, // Klavye açılması için FocusNode kullanılır
                  decoration: InputDecoration(
                    hintText: 'Arama yapın...',
                    prefixIcon: Icon(Icons.search, color: Colors.black), // Arama ikonu burada
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (query) {
                    print('Arama sorgusu: $query');
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                print('Menü butonuna basıldı');
                _showMenu(); // Menü ikonuna basıldığında menüyü göster
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<Supply>>(
        stream: _databaseService.supplies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Henüz tedarik yok'));
          } else {
            final supplies = snapshot.data!;
            return ListView.builder(
              itemCount: supplies.length,
              itemBuilder: (context, index) {
                final supply = supplies[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Icon(Icons.arrow_forward, color: Colors.black),
                    title: Text(supply.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(supply.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SupplyDetailPage(index: index)),
                      );
                      print('${supply.name} tıklandı');
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
