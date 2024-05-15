import 'package:dailythingspro/components/journal/date_view.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:dailythingspro/utils/calendar/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

CalendarOutPut _cal =
    CalendarOutPut(month: 1, data: [], year: 000, currentDayId: "");

int _month = 1;
int _year = 000;
String _selctedId = "";

class JCalendarView extends ConsumerStatefulWidget {
  final Function(String) selectedId;
  const JCalendarView({super.key, required this.selectedId});

  @override
  ConsumerState<JCalendarView> createState() => _JCalendarViewState();
}

class _JCalendarViewState extends ConsumerState<JCalendarView> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    setInitialView();
    super.initState();
  }

  setInitialView() {
    final now = DateTime.now();

    setState(() {
      _cal = getCalendarView(now.month, now.year);
      _month = now.month;
      _year = now.year;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (_selctedId == "") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentDayIndex =
            _cal.data.indexWhere((e) => e.id == _cal.currentDayId);
        if (currentDayIndex != -1) {
          _scrollController.animateTo(currentDayIndex * size.width / 6.5,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut);
        }
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentDayIndex = _cal.data.indexWhere((e) => e.id == _selctedId);
        if (currentDayIndex != -1) {
          _scrollController.animateTo(currentDayIndex * size.width / 6.5,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut);
        }
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(currentDateProvider.notifier).updateID(_cal.currentDayId);
      }
    });

    return SliverToBoxAdapter(
      child: Animate(
        effects: const [
          ScaleEffect(),
          ShimmerEffect(
              delay: Duration(milliseconds: 300),
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut)
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _cal.data.map((e) {
                  return Animate(
                    effects: [
                      FadeEffect(delay: Duration(milliseconds: 25 * e.date))
                    ],
                    child: GestureDetector(
                      onTap: () {
                        widget.selectedId(e.id);
                        ref.read(selectedDateProvider.notifier).updateID(e.id);
                        HapticFeedback.lightImpact();
                        Vibration.vibrate(amplitude: 20, duration: 40);
                        setState(() {
                          _selctedId = e.id;
                        });
                      },
                      child: DateView(
                          date: e.date,
                          day: e.weekDay,
                          isSelectedDate: _selctedId == e.id ? true : false,
                          pastDate: e.pastDate,
                          currentDay: (e.id == _cal.currentDayId)),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${getMonthName(_cal.month)}, $_year",
                    style: TextStyles.heading,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (_month == 1) {
                            _month = 12;
                            _year--;
                          } else {
                            _month--;
                          }
                          setState(() {
                            _cal = getCalendarView(_month, _year);
                          });
                        },
                        child: const Text(
                          "Prev",
                          style: TextStyles.subheading,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (_month == 12) {
                            _month = 1;
                            _year++;
                          } else {
                            _month++;
                          }
                          setState(() {
                            _cal = getCalendarView(_month, _year);
                          });
                        },
                        child: const Text(
                          "Next",
                          style: TextStyles.subheading,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
