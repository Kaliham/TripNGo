import 'package:flutter_neumorphic/flutter_neumorphic.dart';

NeumorphicStyle getNeuStyle() {
  return NeumorphicStyle(
    shape: NeumorphicShape.concave,
    color: Colors.white,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
    depth: 5,
    lightSource: LightSource.topLeft,
    intensity: 0.24,
    surfaceIntensity: 0.23,
  );
}

NeumorphicStyle getImgNeuStyle() {
  return NeumorphicStyle(
    shape: NeumorphicShape.concave,
    color: Colors.white,
    boxShape: NeumorphicBoxShape.circle(),
    depth: 5,
    lightSource: LightSource.topLeft,
    intensity: 0.24,
    surfaceIntensity: 0.23,
  );
}

NeumorphicStyle getTxtNeuStyle() {
  return NeumorphicStyle(
    shape: NeumorphicShape.concave,
    color: Colors.grey[800],
    boxShape: NeumorphicBoxShape.circle(),
    depth: 12,
    lightSource: LightSource.topLeft,
    intensity: 0.83,
    surfaceIntensity: 0.83,
  );
}

NeumorphicStyle getlistItemNeuStyle() {
  return NeumorphicStyle(
    shape: NeumorphicShape.concave,
    color: Colors.grey[200],
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
    depth: 18,
    intensity: 1,
    surfaceIntensity: 0.46,
  );
}
