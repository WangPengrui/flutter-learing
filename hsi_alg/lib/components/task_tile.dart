import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hsi_alg/models/task.dart';
import 'package:provider/provider.dart';
import '../models/task_have.dart';
import 'button.dart';
import 'buttonDataAlg.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final void Function()? onTapData;
  final void Function()? onTapOut;
  final void Function()? onTapAlgorithm;
  const TaskTile({Key? key, required this.task, this.onTapData, this.onTapOut, this.onTapAlgorithm});

  // void addToFavorate(BuildContext context, Widget widget) {
  //   final taskHave = context.read<TaskHave>();
  //   taskHave.addToFavorate(widget.name);
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapOut,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 25, 50, 100),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 任务类别：HyperSpectral Unmixing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.name,
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // 查看所有任务按钮
                Row(
                  children: [
                    MyButtonDataAlg(
                      text: 'Data',
                      onTap: onTapData,
                    ),
                    const SizedBox(width: 10),
                    MyButtonDataAlg(
                      text: 'Algorithm',
                      onTap: onTapAlgorithm,
                    ),
                  ],
                ),
              ],
            ),

            // image
            Image.asset(
              task.imagePath,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
