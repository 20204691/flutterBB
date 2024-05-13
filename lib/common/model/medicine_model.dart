// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  /// static method for write operation
  static Future<void> write({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      DatabaseReference _databaseReference =
          FirebaseDatabase.instance.ref("medicine/$userId");

      await _databaseReference.push().set(data);
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
