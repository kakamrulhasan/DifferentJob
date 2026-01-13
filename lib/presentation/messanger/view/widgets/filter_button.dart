import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.tune, color: Colors.black87),
    );
  }
}