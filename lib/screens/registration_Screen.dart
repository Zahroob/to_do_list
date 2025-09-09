import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/AppRoutes.dart';
import 'package:to_do_list/cubit/LogCubit/cubit/log_cubit_cubit.dart';
import 'package:to_do_list/helpers/validation.dart';
import 'package:to_do_list/widgets/Custom_TextForm_Field.dart';
import 'package:to_do_list/widgets/Custom_button.dart';
import 'package:to_do_list/widgets/Row_Singin_Singup.dart';
import 'package:to_do_list/widgets/gradient_Background.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key, required String message});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confrompasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<LogCubitCubit, LogCubitState>(
          listener: (context, state) {
            if (state is LogCubitSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("التسيجل ناجح ✅")),
              );
              Navigator.pushNamed(context, AppRoutes.dashboard);
            } else if (state is LogCubitFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return GradientBackground(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF3F3F3F),
                          ),
                          'Welcome onboard!',
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 92, 91, 91),
                          ),
                          'Let’s help you meet your tasks',
                        ),
                        const SizedBox(height: 70),
                        CustomTextFormField(
                          controller: usernameController,
                          icon: Icon(Icons.person),
                          label: 'Enter your full name',
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          label: ' email',
                          icon: Icon(Icons.email),
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          label: ' password',
                          obscureText: _obscurePassword,
                          icon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        CustomTextFormField(
                          controller: confrompasswordController,
                          label: 'Confrom password',
                          obscureText: _obscureConfirmPassword,
                          icon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Register',
                          onPressed: () {
                            registerValidators(
                              context,
                              passwordController,
                              usernameController,
                              emailController,
                              confrompasswordController,
                              state,
                            );
                          },
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: RowSinginSingup(
                            text1: 'Already have an account ?',
                            text2: 'Sign in',
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.login);
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
