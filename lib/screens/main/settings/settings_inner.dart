import 'package:dailythingspro/components/common/top_bar.dart';
import 'package:dailythingspro/components/settings/settings_items.dart';
import 'package:dailythingspro/components/settings/settings_top.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsInner extends ConsumerWidget {
  const SettingsInner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyles textStyles = TextStyles(context);

    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(
            "Settings",
            style: textStyles.subheading,
          ),
          stretch: true,
          floating: true,
          leading: const SizedBox.shrink(),
          // backgroundColor: Colors.black,
          expandedHeight: size.height / 2.5,
          flexibleSpace: const TopBar(imgLink: DailyThingsImages.settings),
        ),
        const SettingsTop(),
        const SettingsItems(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "You are using our version 1.0.0, this is one of our very first releases, we will be rolling out many more features soon ✨",
              style: textStyles.italic,
            ),
          ),
        )
      ],
    );
  }
}
