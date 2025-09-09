import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/LogCubit/cubit/log_cubit_cubit.dart';

void registerValidators(
  BuildContext context,
  TextEditingController passwordController,
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController confrompasswordController,
  LogCubitState state,
) {
  state is LogCubitLoading ? null : FocusScope.of(context).unfocus();
  if (usernameController.text.trim().isEmpty ||
      emailController.text.trim().isEmpty ||
      passwordController.text.trim().isEmpty ||
      confrompasswordController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('من فضلك املأ جميع الحقول ❌'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }
  if (passwordController.text.trim().length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('كلمة المرور يجب أن تكون على الأقل 6 حروف'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  if (passwordController.text.trim() != confrompasswordController.text.trim()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('كلمة المرور غير متطابقة ❌'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }
  context.read<LogCubitCubit>().register(
    usernameController.text.trim(),
    emailController.text.trim(),
    passwordController.text.trim(),
  );
}



void loginValidators(
  BuildContext context,
  TextEditingController passwordController,
  TextEditingController usernameController,
  LogCubitState state,
) {
  state is LogCubitLoading ? null : FocusScope.of(context).unfocus();
  if (usernameController.text.trim().isEmpty ||
      passwordController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('من فضلك املأ جميع الحقول ❌'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }
  context.read<LogCubitCubit>().login(
    usernameController.text.trim(),
    passwordController.text.trim(),
  );
}
