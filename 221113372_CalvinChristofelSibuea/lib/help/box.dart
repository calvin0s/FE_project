import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  const Boxes({super.key, required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 4.0, right: 4.0),
          child: Text(
            teks,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      const SizedBox(width: 5, height: 10,)
      ]
    );
  }
}