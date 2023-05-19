import 'dart:ui';

enum Alignment {
  topLeft(-1, -1),
  topCenter(0, -1),
  topRight(1, -1),
  centerLeft(-1, 0),
  center(0, 0),
  centerRight(1, 0),
  bottomLeft(-1, 1),
  bottomCenter(0, 1),
  bottomRight(1, 1);

  const Alignment(this.x, this.y);

  final x, y;
}

class EdgeInsets {
  final double top, bottom, left, right;

  EdgeInsets({this.top = 0, this.bottom = 0, this.left = 0, this.right = 0});

  EdgeInsets.symmetric({double vertical = 0, double horizontal = 0})
      : top = vertical,
        bottom = vertical,
        left = horizontal,
        right = horizontal;

  EdgeInsets.all([double all = 0])
      : top = all,
        bottom = all,
        left = all,
        right = all;

  double get horizontal => left + right;

  double get vertical => top + bottom;
}

class BoxConstraints {
  final double minWidth, maxWidth, minHeight, maxHeight;

  BoxConstraints({
    this.minWidth = 0,
    this.maxWidth = double.infinity,
    this.minHeight = 0,
    this.maxHeight = double.infinity,
  });

  BoxConstraints.loose(
      {double width = double.infinity, double height = double.infinity})
      : maxWidth = width,
        maxHeight = height,
        minWidth = 0,
        minHeight = 0;

  BoxConstraints.tight(
      {double width = double.infinity, double height = double.infinity})
      : maxWidth = width,
        maxHeight = height,
        minWidth = width,
        minHeight = height;
}

abstract class RenderObject {
  Size? size;

  void layout(BoxConstraints constraints);

  void paint(Canvas canvas, Offset offset);
}

abstract class SingleChildRenderObject extends RenderObject {
  SingleChildRenderObject({this.child});

  RenderObject? child;

  @override
  void layout(BoxConstraints constraints) {
    if (child != null) {
      child?.layout(constraints);
      size = child?.size;
    } else {
      size = Size(constraints.maxWidth, constraints.maxHeight);
    }
  }

  @override
  void paint(Canvas canvas, Offset offset) {
    child?.paint(canvas, offset);
  }
}
