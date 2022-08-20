import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.alignment,
    this.child,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      color: color,
      child: Container(
        padding: padding,
        height: height,
        width: width,
        alignment: alignment,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
