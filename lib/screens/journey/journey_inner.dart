import 'package:dailythingspro/components/common/somethingelse/something_else.dart';
import 'package:dailythingspro/components/heatmap/heatmap_activities.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JourneyInner extends ConsumerWidget {
  const JourneyInner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your journey",
                    style: TextStyles.splashHeading,
                  ),
                  Text(
                    "${user.name}, here's your journey so far",
                    style: TextStyles.subheading,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(DailyThingsImages.journey)),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "your activity heat map",
                    style: TextStyles.heading,
                  ),
                  Text(
                    "the more you add daily tasks, the greener it gets",
                    style: TextStyles.italic,
                  )
                ],
              ),
            ),
          ),
          HeatMapActivities(),
          SomethingElse()
        ],
      ),
    );
  }
}
