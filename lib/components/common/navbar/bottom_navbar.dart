import 'dart:ui';
import 'package:dailythingspro/components/common/navbar/navbar_content.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(90),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: const Color.fromARGB(108, 40, 41, 43),
              border:
                  Border.all(color: const Color.fromARGB(97, 255, 255, 255)),
              borderRadius: BorderRadius.circular(90)),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavbarContent(
                  icon: PhosphorIconsRegular.houseSimple,
                  selectedIcon: PhosphorIconsFill.houseSimple,
                  name: "Home",
                  idx: 0,
                ),
                NavbarContent(
                    icon: PhosphorIconsRegular.book,
                    selectedIcon: PhosphorIconsFill.book,
                    name: "Journal",
                    idx: 1),
                NavbarContent(
                    icon: PhosphorIconsRegular.lightbulb,
                    selectedIcon: PhosphorIconsFill.lightbulb,
                    name: "Daily",
                    idx: 2),
                // NavbarContent(
                //     icon: Icon(Icons.settings), name: "Settings", idx: 3),
                NavbarContent(
                    icon: PhosphorIconsRegular.medal,
                    selectedIcon: PhosphorIconsFill.medal,
                    name: "Journey",
                    idx: 4)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
