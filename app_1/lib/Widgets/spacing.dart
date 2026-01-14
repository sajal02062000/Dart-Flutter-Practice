import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  const Spacing({super.key, this.space = 8});
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}

class Gap extends StatelessWidget {
  const Gap({super.key, this.gap = 8});
  final double gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: gap);
  }
}
