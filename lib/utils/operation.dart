import 'dart:math' as math;
import 'package:flutter/material.dart';

class Operation extends ChangeNotifier {
  TextEditingController editingController = TextEditingController();

  void options(String value) {
    switch (value) {
      case '<=':
        clean();
        break;
      case '=':
        result();
        break;
      case 'x\u{00B2}':
        power('x\u{00B2}');
        break;
      default:
        none(value);
        break;
    }
    ChangeNotifier;
  }

  void none(String value) {
    editingController.text += value;
  }

  void clean() {
    editingController.clear();
  }

  double result() {
    return 0;
  }

  double sum(double a, double b) {
    return a + b;
  }

  double sub(double a, double b) {
    return a - b;
  }

  double divide(double a, double b) {
    return a / b;
  }

  double multi(double a, double b) {
    return a * b;
  }

  void power(String value) {
    switch (value) {
      case 'x\u{00B2}':
        editingController.text += '\u{00B2}';
        break;
      default:
        editingController.text += '';
        break;
    }
  }

  double mod(double a, double b) {
    return a % b;
  }

  double square(double a) {
    return math.sqrt(a);
  }

  double pi() {
    return math.pi;
  }
}
