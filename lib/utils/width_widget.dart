import 'package:flutter/widgets.dart';

int getWidth(GlobalKey key)  {
  
  final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
  return renderBox.size.width.toInt();
}