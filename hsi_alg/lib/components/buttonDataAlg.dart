import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtonDataAlg extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButtonDataAlg({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 50, 75, 125),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ),
    );
  }
}