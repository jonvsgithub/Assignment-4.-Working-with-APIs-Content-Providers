import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocalizedText extends StatelessWidget {
  final String textKey;

  LocalizedText({required this.textKey});

  @override
  Widget build(BuildContext context) {
    return Text(Intl.message(textKey));
  }
}
