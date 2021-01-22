import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  // Collection reference
  final brewCollection = FirebaseFirestore.instance.collection('brews');

  DatabaseService({this.uid});

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
