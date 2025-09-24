import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextField extends StatelessWidget {
  VoidCallback? onChanged;
  final TextEditingController? controller;
  final String? hint;
  final IconData? icon;
  final TextInputType? keyboard;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;

  BuildTextField({
    super.key,
    this.onChanged,
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboard = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            if (onChanged != null) onChanged!();
          },
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboard,
          inputFormatters: inputFormatters,
          cursorColor: Theme.of(context).colorScheme.onPrimary,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontFamily: "Font",
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon, color: Colors.grey),
            suffixIcon: suffix,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black45),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary, width: 1.5),
            ),
            isDense: true,
          ),
        ),
      );
    }
}
