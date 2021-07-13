import 'package:butcher_core/butcher_core.dart';
import 'package:butcher_core/src/models/prod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsService {
  ///  ? return all products by categoriy
  Future<List<ProductModel>> findMany(String categoryId) async {
    final ref = FirebaseFirestore.instance.collection('category').doc(categoryId).collection('products');
    final snapshot = await ref.get();
    return snapshot.docs.map((e) => ProductModel.fromMap(e.data())).toList();
  }

  /// ? create new product
  Future<ProductModel> createOne(ProductModel product, String categoryId) async {
    final docRef = FirebaseFirestore.instance.collection('category').doc(categoryId).collection('products').doc();

    final newCategory = product.copyWith(
   //   createdAt: Timestamp.now(),
    //  updatedAt: Timestamp.now(),
      id: docRef.id,
    );
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ? update existing product
/*  Future<ProductModel> updateOne(ProductModel product, String categoryId) async {
    final docRef = FirebaseFirestore.instance.collection('_categories').doc(categoryId).collection('products').doc(product.id);
    final newCategory = product.copyWith(updatedAt: Timestamp.now());
    await docRef.set(newCategory.toMap());
    return newCategory;
  }*/

  /// ! delete existing product
  Future<void> deleteOne(ProductModel product, String categoryId) async {
    final docRef = FirebaseFirestore.instance.collection('category').doc(categoryId).collection('products').doc(product.id);
    return docRef.delete();
  }
}
