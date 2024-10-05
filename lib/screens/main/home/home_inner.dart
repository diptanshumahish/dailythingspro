import 'package:dailythingspro/components/common/top_bar.dart';
import 'package:dailythingspro/components/heatmap/heatmap_activities.dart';
import 'package:dailythingspro/components/home/home_reminders.dart';
import 'package:dailythingspro/components/home/home_top.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeInner extends ConsumerWidget {
  const HomeInner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyles textStyles = TextStyles(context);

    final size = MediaQuery.of(context).size;
    final currentId = ref.watch(currentDateProvider);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar.large(
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(tabsProvider.notifier).updateTab(3);
                },
                icon: const PhosphorIcon(PhosphorIconsFill.flower, color: Colors.black,))
          ],
          title: Text(
            "DailyThings",
            style: textStyles.subheading,
          ),
          stretch: true,
          floating: true,
          leading: const SizedBox.shrink(),
          backgroundColor: Theme.of(context).colorScheme.surface,
          expandedHeight: size.height / 3,
          flexibleSpace: const TopBar(imgLink: DailyThingsImages.home),
        ),
        const HomeTop(
          key: Key("home inner"),
        ),
        HomeReminders(
          id: currentId.id,
        ),
        // PeriodsReminder(),
        const HeatMapActivities(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        )
      ],
    );
  }
}
