import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMapMarker {
  static const markerColor = Color(0xFFFF9800);
  static const double horizontalPadding = 48;
  static const double verticalPadding = 68;
  static const double borderRadius = 24;

  static TextStyle get _textStyle => const TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  static Future<BitmapDescriptor> createCustomMarker(String price) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final textPainter = _createTextPainter(price);
    final size = _calculateSize(textPainter);

    _drawBubble(canvas, size);
    _drawText(canvas, textPainter, size);

    return _convertToIcon(recorder, size);
  }

  static TextPainter _createTextPainter(String text) {
    final textSpan = TextSpan(
      text: text,
      style: _textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();

    return textPainter;
  }

  static Size _calculateSize(TextPainter textPainter) {
    return Size(
      textPainter.width + horizontalPadding,
      textPainter.height + verticalPadding,
    );
  }

  static void _drawBubble(Canvas canvas, Size size) {
    final paint = Paint()..color = markerColor;

    final rect = RRect.fromLTRBAndCorners(
      0,
      0,
      size.width,
      size.height,
      topLeft: const Radius.circular(borderRadius),
      topRight: const Radius.circular(borderRadius),
      bottomRight: const Radius.circular(borderRadius),
      bottomLeft: Radius.zero,
    );

    canvas.drawRRect(rect, paint);
  }

  static void _drawText(Canvas canvas, TextPainter textPainter, Size size) {
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }

  static Future<BitmapDescriptor> _convertToIcon(
    ui.PictureRecorder recorder,
    Size size,
  ) async {
    final image = await recorder.endRecording().toImage(
          size.width.toInt(),
          size.height.toInt(),
        );

    final byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }
}
