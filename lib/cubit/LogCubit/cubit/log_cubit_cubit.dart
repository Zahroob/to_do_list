import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'log_cubit_state.dart';

class LogCubitCubit extends Cubit<LogCubitState> {
  LogCubitCubit() : super(LogCubitInitial());

  /// تسجيل الدخول
  Future<void> login(String email, String password) async {
    emit(LogCubitLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(const LogCubitSuccess("تم تسجيل الدخول بنجاح ✅"));
    } on FirebaseAuthException catch (e) {
      emit(LogCubitFailure(e.message ?? "حدث خطأ في تسجيل الدخول ❌"));
    } catch (e) {
      emit(LogCubitFailure("Unexpected error: $e"));
    }
  }

  /// تسجيل مستخدم جديد
  Future<void> register(String name, String email, String password) async {
    emit(LogCubitLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(const LogCubitSuccess("تم التسجيل بنجاح ✅"));
      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "uid": uid,
        "name": name,
        "email": email,
        "createdAt": DateTime.now(),
      });
    } on FirebaseAuthException catch (e) {
      emit(LogCubitFailure(e.message ?? "حدث خطأ أثناء التسجيل ❌"));
    } catch (e) {
      emit(LogCubitFailure("Unexpected error: $e"));
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(const LogCubitSuccess("تم تسجيل الخروج 👋"));
    } catch (e) {
      emit(LogCubitFailure("فشل تسجيل الخروج: $e"));
    }
  }
}
