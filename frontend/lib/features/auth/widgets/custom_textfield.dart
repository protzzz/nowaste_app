import 'package:flutter/material.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool passwordField;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.passwordField = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final bool isPassword = widget.passwordField;

    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: AppColors.lightGreen,
      obscureText: isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        suffixIcon:
            isPassword
                ? Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    splashRadius: 18,
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white60,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                )
                : null,
      ),

      validator:
          widget.validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Enter your ${widget.hintText.toLowerCase()}';
            }
            return null;
          },
    );
  }
}
