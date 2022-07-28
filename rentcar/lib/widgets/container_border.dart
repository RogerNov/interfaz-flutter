import 'package:flutter/material.dart';

class ContainerBorder extends StatelessWidget {
  final double? height;
  final double? width;
  final Color backgroundColor;
  final Color? borderColor;
  final Widget child;
  final bool? isBoxShadow;
  final double? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? widthBorder;
  final double? elevation;
  final BorderRadius? sidesBorderRadius;
  final bool? isCircle;

  const ContainerBorder({
    Key? key,
    this.height,
    this.width,
    required this.backgroundColor,
    this.borderColor,
    //this.isBorder = false,
    required this.child,
    this.isBoxShadow = true,
    this.borderRadius = 12.0,
    this.padding,
    this.margin,
    this.widthBorder = 1,
    this.elevation = 0,
    this.sidesBorderRadius,
    this.isCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: isCircle!? null: sidesBorderRadius ?? BorderRadius.circular(borderRadius!),
        color: backgroundColor,
        border: Border.all(color: borderColor ?? backgroundColor, width: 0),
        shape: isCircle!?BoxShape.circle:BoxShape.rectangle,
        boxShadow: [
          if (isBoxShadow!)
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(2, 5),
            )
          else
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: elevation!,
              offset: const Offset(1, 0),
            )
        ],
      ),
      child: child,
    );
  }
}
