// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:qr_flutter/qr_flutter.dart';

class Qr extends StatefulWidget {
  const Qr({
    Key key,
    this.width,
    this.height,
    this.data,
    this.size,
    this.backgroundColor,
    this.foregroundColor,
    this.semanticsLabel,
  }) : super(key: key);

  final double width;
  final double height;
  final String data;
  final double size;
  final Color backgroundColor;
  final Color foregroundColor;

  final String semanticsLabel;

  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: QrImage(
          version: QrVersions.auto,
          data: widget.data.toString(),
          size: widget.size,
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.foregroundColor,
          gapless: true,
          semanticsLabel: widget.semanticsLabel.toString()),
    );
  }
}
