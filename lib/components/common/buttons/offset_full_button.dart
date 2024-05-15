import 'package:dailythingspro/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class OffsetFullButton extends StatelessWidget {
  final String content;
  final IconData? icon;
  final VoidCallback fn;
  final bool? notFull;
  final bool? isLoading;
  final bool? darkvariant;
  const OffsetFullButton(
      {super.key,
      this.isLoading = false,
      required this.content,
      required this.fn,
      this.icon,
      this.darkvariant = false,
      this.notFull});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          width: notFull == null ? size.width : size.width / 3,
          decoration: BoxDecoration(
              color: darkvariant!
                  ? DailyThingsColors.backgroundColor
                  : DailyThingsColors.themeOrange,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: darkvariant!
                      ? DailyThingsColors.themeBeige
                      : Colors.black),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(2, 2),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ]),
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: size.height > 840 ? 13.0 : 12),
            child: isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      icon != null
                          ? Icon(
                              icon,
                              color: darkvariant!
                                  ? DailyThingsColors.themeBeige
                                  : Colors.black,
                              size: size.height < 840 ? 15 : 18,
                            )
                          : const SizedBox.shrink(),
                      icon != null
                          ? const SizedBox(
                              width: 5,
                            )
                          : const SizedBox.shrink(),
                      Text(
                        content,
                        style: TextStyle(
                            color: darkvariant! ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Cabinet",
                            fontSize: size.height > 840 ? 15 : 14),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
          ),
        ),
        onPressed: () {
          HapticFeedback.lightImpact();
          Vibration.vibrate(amplitude: 20, duration: 30);

          fn();
        });
  }
}
