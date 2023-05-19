import 'dart:ui';

import 'package:render_tree/rendering/basic.dart';

class RenderAligned extends SingleChildRenderObject {
  RenderAligned({required this.alignment, required RenderObject child})
      : super(child: child);

  Alignment alignment;

  @override
  void layout(BoxConstraints constraints) {
    size = Size(constraints.maxWidth, constraints.maxHeight);
    child!.layout(BoxConstraints.loose(
        width: constraints.maxWidth, height: constraints.maxHeight));
  }

  @override
  void paint(Canvas canvas, Offset offset) {
    assert(size != null && child!.size != null);

    final childMaxOffset = size! - child!.size! as Offset;
    final centerOffset = childMaxOffset / 2;
    final childOffset = centerOffset +
        Offset(centerOffset.dx * alignment.x, centerOffset.dy * alignment.y);

    child!.paint(canvas, childOffset);
  }
}
