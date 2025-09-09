import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/screens/Get_Start_Screen.dart';
import 'package:to_do_list/screens/dashboard_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // ⏳ لسه بيشوف حالة المستخدم
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 👤 المستخدم موجود → Dashboard
        if (snapshot.hasData) {
          return DashboardScreen(message: "أهلا بك 👋");
        }

        // 🚪 المستخدم مش موجود → GetStart
        return const GetStartScreen();
      },
    );
  }
}
