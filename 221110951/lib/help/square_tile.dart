import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {

  final String imagePath;
  final String text1;
  final String text2;
  final Function() ? onTap;
  
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 11, left: 10, right: 10, bottom: 11),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          color: Colors.yellow,
        ),
        child: Column(
          children: [
            Expanded(
              child: 
                Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 50,)
            ),
              const SizedBox(height: 9,),
              Text(text1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Helvetica'),),
              const SizedBox(height: 9,),
              Text(text2,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Helvetica'),),
          ],
        ),
      )
    );
  }
}