import 'package:flutter/material.dart';

class TombolWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const TombolWidget({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
