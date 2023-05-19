import 'dart:ui';

import 'package:render_tree/rendering/basic.dart';

class RenderPadding extends SingleChildRenderObject {
  RenderPadding({required this.padding, required RenderObject child})
      : super(child: child);

  EdgeInsets padding;

  @override
  void layout(BoxConstraints constraints) {
    child!.layout(BoxConstraints(
      minHeight: constraints.minHeight - padding.vertical,
      maxHeight: constraints.maxHeight - padding.vertical,
      minWidth: constraints.minWidth - padding.horizontal,
      maxWidth: constraints.maxWidth - padding.horizontal,
    ));
    size = child!.size! + Offset(padding.horizontal, padding.vertical);
  }

  @override
  void paint(Canvas canvas, Offset offset) {
    child!.paint(canvas, offset + Offset(padding.left, padding.top));
  }
}
