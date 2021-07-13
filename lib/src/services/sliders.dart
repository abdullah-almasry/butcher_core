import 'package:butcher_core/butcher_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SliderService {
  ///  ? return all categories
  Future<List<SliderEnitiy>> findMany() async {
    final ref = FirebaseFirestore.instance.collection('sliders');
    final snapshot = await ref.get();
    return snapshot.docs.map((e) => SliderEnitiy.fromMap(e.data())).toList();
  }

  /// ? create new category
  Future<SliderEnitiy> createOne(SliderEnitiy slider) async {
    final docRef = FirebaseFirestore.instance.collection('sliders').doc();
    final newCategory = slider.copyWith(
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      id: docRef.id,
    );
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ? update existing category
  Future<SliderEnitiy> updateOne(SliderEnitiy slider) async {
    final docRef = FirebaseFirestore.instance.collection('sliders').doc(slider.id);
    final newCategory = slider.copyWith(updatedAt: Timestamp.now());
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ! delete existing category
  Future<void> deleteOne(SliderEnitiy slider) async {
    final docRef = FirebaseFirestore.instance.collection('sliders').doc(slider.id);
    return docRef.delete();
  }
}
