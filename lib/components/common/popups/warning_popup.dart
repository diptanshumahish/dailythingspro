import 'package:dailythingspro/components/common/buttons/offset_full_button.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';

class WarningPopup extends StatelessWidget {
  final String error;
  final VoidCallback? fn;
  final String? errorHeading;
  final String? ctaText;
  final IconData? icon;
  const WarningPopup(
      {super.key,
      required this.error,
      this.fn,
      this.errorHeading,
      this.icon,
      this.ctaText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
                border: Border.all(color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        errorHeading ?? "Umm there's an issue",
                        style: TextStyles.heading,
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    error,
                    style: TextStyles.subheading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OffsetFullButton(
                      icon: icon ?? Icons.cancel_sharp,
                      content: ctaText ?? "close",
                      fn: () {
                        if (fn != null) {
                          fn!();
                        }
                        Navigator.pop(context);
                      }),
                  fn != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: OffsetFullButton(
                              icon: Icons.cancel_sharp,
                              content: "Close",
                              darkvariant: true,
                              fn: () {
                                Navigator.pop(context);
                              }),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
