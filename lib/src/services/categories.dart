import 'package:butcher_core/src/models/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesService {
  ///  ? return all categories
  Future<List<CategoryModel>> findMany() async {
    final ref = FirebaseFirestore.instance.collection('category');
    final snapshot = await ref.get();
    return snapshot.docs.map((e) => CategoryModel.fromMap(e.data())).toList();
  }

  /// ? create new category
  Future<CategoryModel> createOne(CategoryModel category) async {
    final docRef = FirebaseFirestore.instance.collection('category').doc();
    final newCategory = category.copyWith(
     // createdAt: Timestamp.now(),
     // updatedAt: Timestamp.now(),
      id: docRef.id,
    );
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ? update existing category
  Future<CategoryModel> updateOne(CategoryModel category) async {
    final docRef = FirebaseFirestore.instance.collection('category').doc(category.id);
    final newCategory = category.copyWith(
    //    updatedAt: Timestamp.now()
    );
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ! delete existing category
  Future<void> deleteOne(CategoryModel category) async {
    final docRef = FirebaseFirestore.instance.collection('category').doc(category.id);
    return docRef.delete();
  }
}
