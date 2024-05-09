// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

// class MedicineModel {
//   String name;
//   MedicineModel({required this.name});

//   Map<String, dynamic> toJson() => {
//         'name': name,
//       };

//   static MedicineModel fromJson(Map<String, dynamic> json) => MedicineModel(
//         name: json['name'],
//       );
// }

// Future create({required String name}) {
//   CollectionReference items = FirebaseFirestore.instance.collection('medicine');
//   return items.doc().set({
//     'name': name,
//     'dosage': 56,
//     'units': "test",
//     "frequency": 'fr value',
//     "date_time": DateTime.now().toString(),
//     "taken": 'test taken',
//   });
// }

// Future delete({required DocumentSnapshot doc}) {
//   CollectionReference items = FirebaseFirestore.instance.collection('medicine');
//   return items.doc(doc.id).delete();
// }

// Future update({required DocumentSnapshot doc, required String newName}) {
//   CollectionReference items = FirebaseFirestore.instance.collection('medicine');
//   return items.doc(doc.id).update({'name': newName});
// }

class RealtimeDatabase {
  /// static method for write operation
  static void write({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      DatabaseReference _databaseReference =
          FirebaseDatabase.instance.ref("medicine/$userId");

      await _databaseReference.set(data);
    } catch (e) {
      rethrow;
    }
  }

  /// static method for red operation
  static Future<Map> read({required String userId}) async {
    try {
      DatabaseReference _databaseReference =
          FirebaseDatabase.instance.ref("medicine/$userId");
      final snapshot = await _databaseReference.get();
      if (snapshot.exists) {
        Map<String, dynamic> _snapshotValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        return _snapshotValue;
      } else {
        return {};
      }
    } catch (e) {
      rethrow;
    }
  }
}
