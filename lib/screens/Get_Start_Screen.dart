import 'package:flutter/material.dart';
import 'package:to_do_list/AppRoutes.dart';
import 'package:to_do_list/widgets/Custom_button.dart';
import 'package:to_do_list/widgets/gradient_Background.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Image.asset(
                  'assets/image/undraw_mobile_ux_o0e11.png',
                  width: 170,
                  height: 170,
                ),
                const SizedBox(height: 68),
                Text(
                  'Get things done with TODo',
                  style: _getTextStyle(Colors.black, 20, FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Text(
                  'Lorem ipsum dolor sit amet, ',
                  style: _getTextStyle(Colors.grey, 11, FontWeight.normal),
                ),
                const SizedBox(height: 10),
                Text(
                  'consectetur adipiscing elit. Amet. ',
                  style: _getTextStyle(Colors.grey, 11, FontWeight.normal),
                ),
                const SizedBox(height: 60),
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  text: 'Get Started',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _getTextStyle(color, double size, FontWeight fontWeight) {
    return TextStyle(
      decoration: TextDecoration.none,
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
    );
  }
}
