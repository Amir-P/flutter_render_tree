import 'dart:ui';

import 'package:render_tree/rendering/basic.dart';

class Renderer {
  static final _instance = Renderer._();
  late RenderObject root;

  Renderer._() {
    window.onBeginFrame = _onBeginFrame;
  }

  factory Renderer() => _instance;

  void scheduleFrame(RenderObject root) {
    this.root = root;
    window.scheduleFrame();
  }

  void _onBeginFrame(Duration duration) {
    final logicalSize = window.physicalSize / window.devicePixelRatio;
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    root.layout(BoxConstraints(
        maxWidth: logicalSize.width, maxHeight: logicalSize.height));
    root.paint(canvas, Offset.zero);
    final picture = recorder.endRecording();
    final sceneBuilder = SceneBuilder();
    sceneBuilder.addPicture(Offset.zero, picture);
    final scene = sceneBuilder.build();
    window.render(scene);
    window.scheduleFrame();
  }
}

void runApp(RenderObject root) {
  final instance = Renderer();
  instance.scheduleFrame(root);
}
