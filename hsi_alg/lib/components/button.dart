import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 50, 75, 125),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
      
            const SizedBox(width: 10),
      
            Image.asset(
              'lib/images/idea.png', // 替换为你的图片路径
              color: Colors.white, // 如果需要改变图片颜色，可以设置color属性
              width: 20, // 设置图片宽度，根据需要调整
              height: 20, // 设置图片高度，根据需要调整
            ),
          ],
        )
      ),
    );
  }
}