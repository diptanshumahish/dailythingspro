import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedId {
  final String id;

  SelectedId({
    required this.id,
  });
}

class SelectedIDNotifier extends StateNotifier<SelectedId> {
  SelectedIDNotifier(super.state);
  void updateID(String tabNo) {
    state = SelectedId(id: tabNo);
  }
}
