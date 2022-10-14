import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recesslibpjt/models/models.dart';

import 'base_restaurant_repository.dart';

class RestuarantRepository extends BaseRestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestuarantRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
      
        @override
        Stream<List<Restaurant>> getRestaurants() {
          // TODO: implement getRestaurants
          throw UnimplementedError();
        }

  // @override
  // Stream<List<Restaurant>> getRestaurants() {
  //   return _firebaseFirestore
  //       .collection("restaurants")
  //       .snapshots()
  //       .map((snapshot) {
  //     // return snapshot.docs.map((doc) => Restaurant.fromSnapshot(doc)).toList();
  //     return
  //   });
  // }
}
