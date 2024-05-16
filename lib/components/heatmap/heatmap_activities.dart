import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/sqflite/daily/daily_db.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Map<DateTime, int> _heat = {};

class HeatMapActivities extends ConsumerStatefulWidget {
  const HeatMapActivities({
    super.key,
  });

  @override
  ConsumerState<HeatMapActivities> createState() => _HeatMapActivitiesState();
}

class _HeatMapActivitiesState extends ConsumerState<HeatMapActivities> {
  Future<void> updateHeatMap() async {
    for (var task in await DailyDB().fetchAllTasks()) {
      final normalizedDate = DateTime(
          task.createdTime.year, task.createdTime.month, task.createdTime.day);
      if (_heat.containsKey(normalizedDate)) {
        setState(() {
          _heat[normalizedDate] = _heat[normalizedDate]! + 1;
        });
      } else {
        setState(() {
          _heat[normalizedDate] = 1;
        });
      }
    }
  }

  @override
  void initState() {
    updateHeatMap();
    print(_heat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ref.listen(currentDateProvider, (previous, next) {
      updateHeatMap();
    });

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your activities data",
              style: TextStyles.subheading,
            ),
            SizedBox(
              height: 10,
            ),
            Animate(
              effects: [ScaleEffect()],
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white12,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeatMap(
                    startDate: ref.watch(appStartDateProvider).date,
                    endDate: DateTime.now(),
                    colorMode: ColorMode.opacity,
                    datasets: _heat,
                    defaultColor: DailyThingsColors.themeBeige,
                    scrollable: true,
                    showText: true,
                    textColor: Colors.white,
                    // showColorTip: false,
                    colorTipHelper: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "less active",
                          style: TextStyles.caption,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "more active",
                          style: TextStyles.caption,
                        ),
                      )
                    ],
                    colorTipCount: 3,
                    colorsets: {1: Colors.green},
                    margin: EdgeInsets.all(4),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
