import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference supplyCollection = FirebaseFirestore.instance.collection('supplies');

  // Veri Ekleme
  Future<DocumentReference> addSupply(String name, String sector, String description) async {
    return await supplyCollection.add({
      'name': name,
      'sector': sector,
      'description': description,
    });
  }

  // Veri Okuma
  Stream<List<Supply>> get supplies {
    return supplyCollection.snapshots().map(_supplyListFromSnapshot);
  }

  List<Supply> _supplyListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Supply(
        name: doc['name'] ?? '',
        sector: doc['sector'] ?? '',
        description: doc['description'] ?? '',
      );
    }).toList();
  }
}

class Supply {
  final String name;
  final String sector;
  final String description;

  Supply({required this.name, required this.sector, required this.description});
}

