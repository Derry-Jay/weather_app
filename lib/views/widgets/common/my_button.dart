import 'package:flutter/material.dart';

import '../../../../extensions/extensions.dart';
import '../../../../utils/enums.dart';
import 'custom_button.dart';

class MyButton extends StatelessWidget {
  final Widget? child;
  final ButtonType? type;
  final OutlinedBorder? shape;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  const MyButton(
      {super.key,
      this.type,
      this.child,
      this.shape,
      this.padding,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        type: type,
        shape: shape,
        padding: padding,
        onPressed: onPressed,
        buttonColor: context.theme.primaryColor,
        child: child);
  }
}
