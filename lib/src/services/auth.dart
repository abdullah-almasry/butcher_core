import 'package:butcher_core/src/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // firebase auth instance
  static final _auth = FirebaseAuth.instance;

  // return turn if the user is logged in;
  static bool get isLoggedIn => _auth.currentUser != null;

  // return the current user;
  static User get authUser {
    final user = _auth.currentUser;
    if (user == null) {
      throw 'cant get user form db since he is not logged in';
    } else {
      return user;
    }
  }

  Future<AppUser> getUserFromDatabase() async {
    final ref = FirebaseFirestore.instance.doc('users/${authUser.uid}');
    final userDoc = await ref.get();
    if (userDoc.data() == null) throw 'user does not exist';
    return AppUser.fromMap(userDoc.data()!);
  }

  Future<bool> isUserExist(String uid) async {
    final ref = FirebaseFirestore.instance.doc('users/$uid');
    final userDoc = await ref.get();

    return userDoc.data() != null;
  }

  Future<void> updateUserInDatabase(AppUser user) async {
    final ref = FirebaseFirestore.instance.doc('users/${authUser.uid}');
    return ref.update(user.copyWith(updatedAt: Timestamp.now()).toMap());
  }

  Future<void> addUserInDatabase(AppUser user) async {
    final ref = FirebaseFirestore.instance.collection('users').doc(user.uid);
    return ref.set(user.copyWith(updatedAt: Timestamp.now()).toMap());
  }

  // Future<void> updateUserNumber({
  //   String phone,
  // }) async {
  //   try {
  //     final currentUserRef = FirebaseFirestore.instance.doc('Users/${user.uid}');
  //     await currentUserRef.update({"phone": phone});
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

  // Future<void> updateUserUid({
  //   String uid,
  // }) async {
  //   try {
  //     final currentUserRef = FirebaseFirestore.instance.doc('Users/${user.uid}');
  //     await currentUserRef.update({"userId": uid});
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

  // Future<void> addUserToFireStore(UserModel userModel) async {
  //   final currentUserRef = FirebaseFirestore.instance.doc('Users/${user.uid}');
  //   return await currentUserRef.set(userModel.toJson());
  // }
}
