import 'package:dailythingspro/components/common/top_bar.dart';
import 'package:dailythingspro/components/daily/dailyTop.dart';
import 'package:dailythingspro/components/daily/daily_progress.dart';
import 'package:dailythingspro/components/daily/daily_tasks.dart';
import 'package:dailythingspro/components/daily/task_list.dart';
import 'package:dailythingspro/components/journal/j_calendar_view.dart';
import 'package:dailythingspro/constants/images.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

double _progress = 0;

class DailyInner extends ConsumerStatefulWidget {
  const DailyInner({super.key});

  @override
  ConsumerState<DailyInner> createState() => _DailyInnerState();
}

class _DailyInnerState extends ConsumerState<DailyInner> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final selectedDate = ref.watch(selectedDateProvider);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar.large(
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(tabsProvider.notifier).updateTab(3);
                },
                icon: const PhosphorIcon(PhosphorIconsFill.flower))
          ],
          title: const Text(
            "Organize your life",
            style: TextStyles.subheading,
          ),
          stretch: true,
          floating: true,
          leading: const SizedBox.shrink(),
          backgroundColor: Colors.black,
          expandedHeight: size.height / 4.5,
          flexibleSpace: const TopBar(imgLink: DailyThingsImages.dailyPage),
        ),
        const DailyTop(),
        JCalendarView(selectedId: (data) {}),
        DailyProgress(progress: _progress),
        const DailyTasks(),
        TaskList(
          selectedDate: selectedDate.id,
          progress: (data) {
            setState(() {
              _progress = data;
            });
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
          ),
        ),
      ],
    );
  }
}
