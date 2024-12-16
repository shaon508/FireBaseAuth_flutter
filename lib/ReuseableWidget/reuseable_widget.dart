import 'package:flutter/material.dart';
// Custom Text Field for the app
TextField customTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    style: TextStyle(
      color: Colors.white, // Changed to Colors.white for better visibility
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      labelText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
// Custom Elevated Button for the app
ElevatedButton customButton(String text, VoidCallback onClick) {
  return ElevatedButton(
    onPressed: onClick,
    child: Text(text),
  );
}
