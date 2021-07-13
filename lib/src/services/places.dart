import 'package:butcher_core/butcher_core.dart';
import 'package:butcher_core/src/models/place_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlacesService {
  ///  ? return all categories
  Future<List<PlacesModel>> findMany() async {
    final ref = FirebaseFirestore.instance.collection('Places');
    final snapshot = await ref.get();
    return snapshot.docs.map((e) => PlacesModel.fromMap(e.data())).toList();
  }

  /// ? create new category
  Future<PlacesModel> createOne(PlacesModel Places) async {
    final docRef = FirebaseFirestore.instance.collection('Places').doc();
    final newCategory = Places.copyWith();
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ? update existing category
  Future<PlacesModel> updateOne(PlacesModel Places) async {
    final docRef = FirebaseFirestore.instance
        .collection('Places')
        .doc('xC15LCGKXgaXz1oRqAPr');
    final newCategory = Places.copyWith();
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ! delete existing category
  Future<void> deleteOne(PlacesModel Places) async {
    final docRef = FirebaseFirestore.instance.collection('Places').doc('');
    return docRef.delete();
  }
}
