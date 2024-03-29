// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Padding inputBox(String label, bool visible, dynamic controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      obscureText: visible,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white38),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade900),
        ),
        hintText: label,
        hintStyle: TextStyle(color: Colors.white38),
        fillColor: Colors.grey.shade900,
        filled: true,
      ),
    ),
  );
}
