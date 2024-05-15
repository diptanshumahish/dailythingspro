import 'dart:ui';
import 'package:dailythingspro/components/common/mood/mood_choser.dart';
import 'package:dailythingspro/components/common/popups/warning_popup.dart';
import 'package:dailythingspro/constants/colors.dart';
import 'package:dailythingspro/constants/text_styles.dart';
import 'package:dailythingspro/sqflite/journal/journal_db.dart';
import 'package:dailythingspro/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

bool _isContentAvailable = false;
final TextEditingController _titleController = TextEditingController();
final TextEditingController _detailsController = TextEditingController();
String _responseMood = "blank";

class WriterScreen extends ConsumerStatefulWidget {
  final String id;
  const WriterScreen({super.key, required this.id});

  @override
  ConsumerState<WriterScreen> createState() => _WriterScreenState();
}

class _WriterScreenState extends ConsumerState<WriterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DailyThingsColors.backgroundColor,
      floatingActionButton: GestureDetector(
        onTap: () async {
          if (mounted) {
            if (!_isContentAvailable) {
              Navigator.pop(context);
            } else {
              if (_titleController.text.isNotEmpty &&
                  _detailsController.text.isNotEmpty) {
                final res = await JournalDB().createJournal(
                    title: _titleController.text,
                    dayKey: widget.id,
                    description: _detailsController.text,
                    mood: _responseMood);

                if (res != 0) {
                  _titleController.clear();
                  _detailsController.clear();
                  ref.read(selectedDateProvider.notifier).updateID(widget.id);
                  Navigator.pop(context);
                }
              } else {
                showDialog(
                    context: context,
                    builder: (context) => const WarningPopup(
                        error: "You haven't entered all fields"));
              }
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              _isContentAvailable ? Icons.check : Icons.close,
              size: 15,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: DailyThingsColors.backgroundColor,
              title: const Text(
                "Pen down your thoughts",
                style: TextStyles.subheading,
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: DailyThingsColors.themeBeige,
                  )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MoodChooser(
                      moodResponse: (mood) {
                        setState(() {
                          _responseMood = mood;
                        });
                      },
                      selectedOne: _responseMood,
                    ),
                    Animate(
                      effects: const [FadeEffect()],
                      child: Text(
                        DateFormat("dd MMMM, y | hh:mm a")
                            .format(DateTime.now()),
                        style: TextStyles.bodyNavbarActive,
                      ),
                    ),
                    const Divider(
                      color: Colors.white12,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Animate(
                      effects: const [
                        FadeEffect(delay: Duration(milliseconds: 100))
                      ],
                      child: TextField(
                        onChanged: (val) => {
                          if (val.isEmpty)
                            {
                              setState(() {
                                _isContentAvailable = false;
                              })
                            }
                          else
                            {
                              setState(() {
                                _isContentAvailable = true;
                              })
                            }
                        },
                        controller: _titleController,
                        scrollPadding: EdgeInsets.zero,
                        autocorrect: false,
                        style: TextStyles.heading,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        selectionHeightStyle: BoxHeightStyle.tight,
                        maxLines: 2,
                        minLines: 1,
                        spellCheckConfiguration:
                            SpellCheckConfiguration.disabled(),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            labelText: "Your great title",
                            isCollapsed: true,
                            labelStyle: TextStyles.headingPlaceholder,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Animate(
                      effects: const [
                        FadeEffect(delay: Duration(milliseconds: 200))
                      ],
                      child: TextFormField(
                        controller: _detailsController,
                        spellCheckConfiguration:
                            SpellCheckConfiguration.disabled(),
                        selectionHeightStyle: BoxHeightStyle.tight,
                        scrollPadding: EdgeInsets.zero,
                        style: TextStyles.body,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 400,
                        selectionWidthStyle: BoxWidthStyle.tight,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          labelText: "pen down your thoughts",
                          labelStyle: TextStyles.body,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          isCollapsed: true,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
