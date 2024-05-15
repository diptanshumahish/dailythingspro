import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ReminderItem extends StatelessWidget {
  final String desc;
  final String completionTime;
  const ReminderItem(
      {super.key, required this.completionTime, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                desc,
                style: TextStyles.bodyNavbarActive,
              ),
              Text(
                completionTime,
                style: TextStyles.italic,
              )
            ],
          ),
          // Divider(
          //   color: Colors.white54,
          // )
        ],
      ),
    );
  }
}
