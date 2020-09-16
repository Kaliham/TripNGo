import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Color lightBackgroundColor = Colors.deepPurple[50];
Size size;
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
    shape: NeumorphicShape.convex,
    color: Colors.deepPurple[50],
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
    depth: 8,
    intensity: 0.66,
    surfaceIntensity: 0.01,
  );
}

NeumorphicStyle getCircBtnNeuStyle() {
  return NeumorphicStyle(
    shape: NeumorphicShape.convex,
    color: Colors.deepPurple[50],
    boxShape: NeumorphicBoxShape.circle(),
    depth: 8,
    intensity: 0.66,
    surfaceIntensity: 0.01,
  );
}

NeumorphicStyle getlistItemDarkNeuStyle() {
  return NeumorphicStyle(
    shape: NeumorphicShape.convex,
    color: Colors.deepPurple[600],
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
    depth: 8,
    intensity: 0.66,
    surfaceIntensity: 0.01,
  );
}

NeumorphicStyle getRegisterNeuStyle() {
  return NeumorphicStyle(
    shape: NeumorphicShape.convex,
    color: Colors.deepPurple[800],
    shadowLightColor: Colors.deepPurple[800],
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
    depth: 8,
    intensity: 0.66,
    surfaceIntensity: 0.01,
  );
}
