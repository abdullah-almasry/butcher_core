import 'package:bloc/bloc.dart';
import 'package:butcher_core/butcher_core.dart';
import 'package:butcher_core/src/comman/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthCubit authCubit;
  String _counteryCode = '+966';
  late String _phoneNo;
  late String _verificationId;
  String get phoneNo => _phoneNo;
  String get counterCode => _counteryCode;
  SignInCubit(this.authCubit) : super(SignInInitial());
  final _auth = FirebaseAuth.instance;

  Future<void> signInWithPhone(String phone) async {
    try {
      _phoneNo = _counteryCode + phone;
      log(_phoneNo);
      log('رقم الهاتف' + _phoneNo);
      emit(SignInLoading());
      await _auth.verifyPhoneNumber(
        phoneNumber: _counteryCode + phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          emit(SignInFail(e.toString()));
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          emit(SignInSucess(SignInResult.confrimCode));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      // emit(SignInSucess(SignInResult.confrimCode));
    } catch (e) {
      emit(SignInFail(e.toString()));
      log(e.toString());
    }
  }

  Future<void> confirmSignInCode(String smsCode) async {
    try {
      emit(SignInLoading());

      // Create a PhoneAuthCredential with the code
      final credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await _auth.signInWithCredential(credential);
      final userAleradyExist = await AuthService().isUserExist(AuthService.authUser.uid);
      if (!userAleradyExist) {
        // TODO :: create empty profile
      }

      emit(SignInSucess(SignInResult.sucess));
      return authCubit.checkUserAuthStats();
    } catch (e) {
      emit(SignInFail(e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(SignInLoading());
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSucess(SignInResult.confrimCode));
      return authCubit.checkUserAuthStats();
    } catch (e) {
      emit(SignInFail(e.toString()));
    }
  }

  void setCountreyCode(String code) {
    _counteryCode = code;
    emit(SignInInitial());
  }
}
