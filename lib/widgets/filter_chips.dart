import 'package:flutter/material.dart';

enum wordCase { upperCase, capitalized }

class FilterChips extends StatelessWidget {
  final text;
  final wordCase textCase;
  final Function(String) onDeleteTap;

  const FilterChips({
    super.key,
    this.text,
    required this.textCase,
    required this.onDeleteTap,
  });

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(
        textCase == wordCase.upperCase ? text.toUpperCase() : capitalize(text),
        style: TextStyle(fontFamily: "roboto", fontSize: 14),
      ),
      deleteIcon: Icon(Icons.clear),
      onDeleted: () {
        onDeleteTap(text);
      },
      backgroundColor: Color(0xFFBDBDBD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
