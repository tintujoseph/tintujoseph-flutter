import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final VoidCallback onPressed;
  final bool isButton;

  HeaderItem({
    this.title,
    this.onPressed,
    this.isButton = false,
  });
}
