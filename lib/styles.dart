import 'package:flutter/material.dart';

InputDecoration inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}
