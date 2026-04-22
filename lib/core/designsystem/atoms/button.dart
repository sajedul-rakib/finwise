import 'package:finwise/core/designsystem/design_system.dart';
import 'package:flutter/material.dart';

class FinWiseButton extends StatelessWidget {
  final Function()? onPressed;

  const FinWiseButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Semantics(
      label: "A button for press and action",
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: FinWiseRadius.buttonRadius,
            // color: isDark?
          ),
        ),
      ),
    );
  }
}
