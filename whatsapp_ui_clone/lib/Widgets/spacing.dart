import 'package:flutter/material.dart';

enum Type { horizontal, vertical }

class Spacing extends StatelessWidget {
  const Spacing({super.key, this.spacing = 8, this.type = Type.horizontal});
  final Type type;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: type == Type.horizontal ? spacing : 0,
      height: type == Type.vertical ? spacing : 0,
    );
  }
}
