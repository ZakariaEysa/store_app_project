import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final Function(String)? onChanged;
  CustomTextField(
      {this.onChanged, super.key, required this.name, this.inputType});
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextField(
        keyboardType: inputType,
        //obscureText: name == "Email" ? false : true,

        onChanged: onChanged,
        // style: const TextStyle(color: Color(0xffE0E6EB)),
        decoration: InputDecoration(
          // hintStyle: const TextStyle(color: Color(0xffE0E6EB)),

          contentPadding:
              const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          hintText: name,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            // borderSide: BorderSide(color: Colors.white),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            //  borderSide: BorderSide(color: Colors.white),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            // borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
