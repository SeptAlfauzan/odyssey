import 'package:flutter/material.dart';

class OdysseyTextStyle {
  static TextStyle header() => const TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'JakartaSans',
      );
  static TextStyle subtitle() => const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'JakartaSans',
      );
  static TextStyle body() => const TextStyle(
        fontSize: 12.0,
        fontFamily: 'JakartaSans',
      );
  static TextStyle content() => const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
      fontFamily: 'JakartaSans');
}
