import 'package:flutter/material.dart';

class NumberTile extends StatelessWidget {
  final int number;
  final bool isHighlighted;

  const NumberTile({super.key, required this.number, required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.amber : Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isHighlighted ? Colors.black : Colors.black87,
        ),
      ),
    );
  }
}
