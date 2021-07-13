import 'package:butcher_core/src/models/tlabaty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TlabatyService {
  ///  ? return all categories
  Future<List<TlabatyModel>> findMany(String user_id) async {
    final ref = FirebaseFirestore.instance.collection('order').where('user_id', isEqualTo: user_id);
    final snapshot = await ref.get();
    return snapshot.docs.map((e) => TlabatyModel.fromMap(e.data())).toList();
  }

  /// ? update existing category
  Future<TlabatyModel> updateOne(TlabatyModel tlabaty, String status) async {
    final docRef = FirebaseFirestore.instance.collection('order').doc(tlabaty.user_id);
    final newtlabaty = tlabaty.copyWith(status: status
        //    updatedAt: Timestamp.now()
        );
    await docRef.set(newtlabaty.toMap());
    return newtlabaty;
  }

  /// ! delete existing category
  Future<void> deleteOne(TlabatyModel tlabaty) async {
    final docRef = FirebaseFirestore.instance.collection('order').doc(tlabaty.user_id);
    return docRef.delete();
  }
}
