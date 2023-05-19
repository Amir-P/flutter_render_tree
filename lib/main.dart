import 'dart:ui';

import 'package:render_tree/renderer.dart';
import 'package:render_tree/rendering/basic.dart';
import 'package:render_tree/rendering/render_aligned.dart';
import 'package:render_tree/rendering/render_colored_box.dart';
import 'package:render_tree/rendering/render_sized_box.dart';

void main() {
  runApp(RenderAligned(
      alignment: Alignment.topCenter,
      child: RenderSizedBox(
          size: Size(500, 300),
          child: RenderColoredBox(color: Color(0xFF357835)))));
}
