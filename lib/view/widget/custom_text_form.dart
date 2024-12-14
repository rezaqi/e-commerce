import 'package:flutter/material.dart';
import 'package:rezaqi_ecommerce/core/constant/colors.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.myController,
    required this.label,
    required this.showText,
    required this.valid,
    this.keyboardType,
    required this.colorForm,
  });
  final String hintText;
  final String label;
  final Color colorForm;
  final bool showText;
  final String? Function(String?) valid;
  final TextEditingController myController;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
// ==========================Text Form Field =========================== //
      child: TextFormField(
        keyboardType: keyboardType,
        validator: valid,
        obscureText: showText,
        controller: myController,
        enableInteractiveSelection: false,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17,
            color: AppColor.blackWithOpacity,
            fontWeight: FontWeight.w500),

// ================================= Input Decoration ======================= //
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: AppColor.buttonCo,
            fontSize: 19,
          ),

// ================================ Out line Border ===================== //
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          filled: true,
          fillColor: colorForm,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        ),
      ),
    );
  }
}
