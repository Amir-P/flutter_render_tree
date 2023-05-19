import 'dart:ui';

import 'basic.dart';

class RenderColoredBox extends SingleChildRenderObject {
  RenderColoredBox({required this.color, super.child});

  Color color;

  @override
  void paint(Canvas canvas, Offset offset) {
    assert(size != null);
    canvas.drawRect(
        Rect.fromLTWH(offset.dx, offset.dy, size!.width, size!.height),
        Paint()..color = color);
  }
}
