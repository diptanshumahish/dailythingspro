import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopBar extends ConsumerWidget {
  final String imgLink;

  const TopBar({
    super.key,
    required this.imgLink,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return FlexibleSpaceBar(
        background: Animate(
      effects: const [ScaleEffect(curve: Curves.easeInOut)],
      child: Image.asset(
        height: size.height / 2.5,
        width: size.width,
        imgLink,
        fit: BoxFit.cover,
      ),
    ));
  }
}
