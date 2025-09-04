import 'package:flutter/material.dart';

class RowSinginSingup extends StatelessWidget {
  const RowSinginSingup({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });
  final String text1;
  final String text2;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text1),
        SizedBox(width: 5),
        GestureDetector(
          onTap: onTap,
          child: Text(style: TextStyle(color: Color(0XFFB83F0B)), text2),
        ),
      ],
    );
  }
}
