import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/AppRoutes.dart';
import 'package:to_do_list/cubit/LogCubit/cubit/log_cubit_cubit.dart';
import 'package:to_do_list/widgets/Custom_button.dart';
import 'package:to_do_list/widgets/Row_Singin_Singup.dart';
import 'package:to_do_list/widgets/gradient_Background.dart';
import 'package:to_do_list/widgets/text_from_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required String message});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: BlocConsumer<LogCubitCubit, LogCubitState>(
          listener: (context, state) {
            if (state is LogCubitSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("تسجيل الدخول ناجح ✅")),
              );
              Navigator.pushNamed(context, AppRoutes.dashboard);
            } else if (state is LogCubitFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LogCubitLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF3F3F3F),
                          ),
                          'Welcome back!',
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 92, 91, 91),
                          ),
                          'Let’s help you meet your tasks',
                        ),
                        SizedBox(height: 20),
                        Image.asset('assets/image/my_notifications_rjej 1.png'),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: emailController,
                          label: 'Email',
                          icon: Icon(Icons.email),
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          label: 'password',
                          obscureText: _obscureText,
                          icon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        Text(
                          style: TextStyle(color: Color(0XFFB83F0B)),
                          'Forget Password',
                        ),
                        const SizedBox(height: 25),
                        CustomButton(
                          text: 'Login',
                          onPressed: () {
                            context.read<LogCubitCubit>().login(
                                  emailController.text,
                                  passwordController.text,
                                );
                          },
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: RowSinginSingup(
                            text1: 'Don’t have an account ?',
                            text2: 'Sign up',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.registration);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
