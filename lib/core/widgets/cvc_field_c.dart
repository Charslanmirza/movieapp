import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final int? maxLength;
  final int? maxLines;
  Widget? prefixIcon;
  final String? headText;
  final void Function(String)? onChanged;
  final String? initialValue;
  final bool isMainScreenText;
  final bool readOnly;
  TextInputType? keyboardType;
  void Function()? onTap;
  TextEditingController? controller;

  CustomTextField(
      {this.labelText,
      this.hintText,
      this.validator,
      this.maxLength,
      this.suffixIcon,
      this.obscureText,
      this.initialValue,
      this.maxLines,
      this.prefixIcon,
      this.onChanged,
      this.headText,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.controller,
      this.isMainScreenText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          onTap: onTap,
          keyboardType: keyboardType,
          maxLength: maxLength,
          readOnly: readOnly,
          textAlign: TextAlign.start,
          maxLines: obscureText == true ? 1 : maxLines,
          initialValue: initialValue,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            fillColor: Theme.of(context)
                .colorScheme
                .onSecondaryContainer
                .withOpacity(.7),
            filled: true,
            contentPadding: EdgeInsets.all(10),
            labelText: labelText,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer), // Set border color
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            // errorBorder: ,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer), // Set border color
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer), // Set border color
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
