import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
}
