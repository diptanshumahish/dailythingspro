import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ReminderItem extends StatelessWidget {
  final String desc;
  final String completionTime;
  const ReminderItem(
      {super.key, required this.completionTime, required this.desc});

  @override
  Widget build(BuildContext context) {
    TextStyles textStyles = TextStyles(context);

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
                style: textStyles.bodyNavbarActive,
              ),
              Text(
                completionTime,
                style: textStyles.italic,
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
