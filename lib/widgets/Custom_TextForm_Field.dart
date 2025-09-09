import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.icon,
    this.controller,
    this.obscureText,
  });
  final String label;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? obscureText;
  

  @override
  State<CustomTextFormField> createState() => _TextFromFieldState();
}

class _TextFromFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText ?? false,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter ${widget.label}';
              }
              if (widget.label == 'Enter your email' && !value.contains('@')) {
                return 'Enter valid email';
              }
              return null;
            },

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 253, 253),
              suffixIcon: widget.icon,
              label: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                  widget.label,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
