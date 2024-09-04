import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isHasSuffixIcon;
  final TextInputType keyboardType;
  final bool? obscureText;
  final TextEditingController control;
  final isHasPrefixIcon;

  const CustomTextfield({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.isHasSuffixIcon,
    required this.keyboardType,
    this.obscureText,
    required this.control,
   required this.isHasPrefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightForFinite(),
      child: TextFormField(
        controller: control,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          prefixIcon:isHasPrefixIcon? prefixIcon:null,
          suffixIcon: isHasSuffixIcon ? suffixIcon : null,
          fillColor: Color(0xffF0F3F6),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color(0xffADB3BC),
              fontSize: 16,
              fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xff156778),
            ),
          ),
        ),
      ),
    );
  }
}
