import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/PlacesModel.dart';

class FirebasePlaces {
  Stream<List<Places>>? getPlaces() {
    return FirebaseFirestore.instance
        .collection('places')
        .snapshots()
        .map((snaps) => snaps.docs.map((doc) {
              return Places.fromJson(doc.data());
            }).toList());
  }
}
