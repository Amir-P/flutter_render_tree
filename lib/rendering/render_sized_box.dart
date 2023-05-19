import 'dart:ui';

import 'basic.dart';

class RenderSizedBox extends SingleChildRenderObject {
  final Size preferredSize;

  RenderSizedBox({required Size size, super.child}) : preferredSize = size;

  @override
  void layout(BoxConstraints constraints) {
    var width = constraints.minWidth;
    if (preferredSize.width > width &&
        preferredSize.width < constraints.maxWidth) {
      width = preferredSize.width;
    } else {
      width = constraints.maxWidth;
    }
    var height = constraints.minHeight;
    if (preferredSize.height > height &&
        preferredSize.height < constraints.maxHeight) {
      height = preferredSize.height;
    } else {
      height = constraints.maxHeight;
    }
    size = Size(width, height);
    child?.layout(
        BoxConstraints.tight(width: size!.width, height: size!.height));
  }
}
