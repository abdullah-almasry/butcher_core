import 'package:butcher_core/butcher_core.dart';
import 'package:butcher_core/src/models/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  ///  ? return all categories
  Future<List<PaymentModel>> findMany() async {
    final ref = FirebaseFirestore.instance.collection('Payment');
    final snapshot = await ref.get();
    return snapshot.docs.map((e) => PaymentModel.fromMap(e.data())).toList();
  }

  /// ? create new category
  Future<PaymentModel> createOne(PaymentModel Payment) async {
    final docRef = FirebaseFirestore.instance.collection('Payment').doc();
    final newCategory = Payment.copyWith(
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      id: docRef.id,
    );
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ? update existing category
  Future<PaymentModel> updateOne(PaymentModel Payment) async {
    final docRef = FirebaseFirestore.instance.collection('Payment').doc(Payment.id);
    final newCategory = Payment.copyWith(updatedAt: Timestamp.now());
    await docRef.set(newCategory.toMap());
    return newCategory;
  }

  /// ! delete existing category
  Future<void> deleteOne(PaymentModel Payment) async {
    final docRef = FirebaseFirestore.instance.collection('Payment').doc(Payment.id);
    return docRef.delete();
  }
}
