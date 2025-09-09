import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/AppRoutes.dart';
import 'package:to_do_list/Hive/task_model.dart';
import 'package:to_do_list/Hive/task_repository.dart';
import 'package:to_do_list/cubit/LogCubit/cubit/log_cubit_cubit.dart';
import 'package:to_do_list/cubit/TaskCubit/task_cubit.dart';
import 'package:to_do_list/helpers/AuthWrapper.dart';
import 'package:to_do_list/model/task_model_adapter.dart';
import 'package:to_do_list/screens/Get_Start_Screen.dart';
import 'package:to_do_list/screens/Login_screen.dart';
import 'package:to_do_list/screens/dashboard_screen.dart';
import 'package:to_do_list/screens/registration_Screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasksBox');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit(TaskRepository())),
        BlocProvider(create: (constext) => LogCubitCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),

        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.getStart:
              return MaterialPageRoute(builder: (_) => const GetStartScreen());
            case AppRoutes.login:
              final args = settings.arguments as String?;
              return MaterialPageRoute(
                builder: (_) => LoginScreen(message: args ?? "صفحة الدخول"),
              );

            case AppRoutes.registration:
              final args = settings.arguments as String?;
              return MaterialPageRoute(
                builder: (_) =>
                    RegistrationScreen(message: args ?? "صفحة التسجيل"),
              );

            case AppRoutes.dashboard:
              final args = settings.arguments as String?;
              return MaterialPageRoute(
                builder: (_) => DashboardScreen(message: args ?? "صفحة التحكم"),
              );

            case AppRoutes.authWrapper:
              return MaterialPageRoute(builder: (_) => const AuthWrapper());

            default:
              return MaterialPageRoute(
                builder: (_) => const Scaffold(
                  body: Center(child: Text("404 - الصفحة غير موجودة")),
                ),
              );
          }
        },
        home: AuthWrapper(),
      ),
    );
  }
}
