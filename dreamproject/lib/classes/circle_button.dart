import 'package:flutter/material.dart';

class OutlineCircleButton extends StatelessWidget {
  OutlineCircleButton({
    this.onTap,
    this.borderSize: 0.5,
    this.radius: 20.0,
    this.borderColor: Colors.white,
    this.foregroundColor: Colors.white,
    this.child,
  });

  final onTap;
  final radius;
  final borderSize;
  final borderColor;
  final foregroundColor;
  final child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderSize),
          color: Color(0xff3AAFFC),
          shape: BoxShape.circle,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              child: child ?? SizedBox(),
              onTap: () async {
                if (onTap != null) {
                  onTap();
                }
              }),
        ),
      ),
    );
  }
}
