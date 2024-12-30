import 'package:flutter/material.dart';
import 'share_page.dart'; // SharePage sayfasını projeninize eklediğinizi varsayıyorum
import 'login_page.dart'; // LoginPage sayfasını projenize eklediğinizi varsayıyorum
import 'applied_supplies_page.dart'; // AppliedSuppliesPage sayfasını projenize eklediğinizi varsayıyorum

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profilim'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar.png'), // Avatar resmi
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kullanıcı Adı',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'example@mail.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Tedarik Paylaş', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SharePage()),
              );
              print('Tedarik Paylaş tıklandı');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Başvurduğum Tedarikler', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppliedSuppliesPage()),
              );
              print('Başvurduğum Tedarikler tıklandı');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Paylaştığım Tedarikler', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppliedSuppliesPage()), // Aynı sayfaya yönlendirildiğini varsayıyoruz
              );
              print('Paylaştığım Tedarikler tıklandı');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Çıkış Yap', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              print('Çıkış Yap tıklandı');
            },
          ),
        ],
      ),
    );
  }
}
