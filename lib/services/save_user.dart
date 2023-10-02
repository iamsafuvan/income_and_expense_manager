import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _save = FirebaseFirestore.instance;

  Future<void> saveUser(String name, email, uid) async {
    await _save
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name});
  }
}
