import 'package:flutter/material.dart';

import '../extensions/color_extensions';

class FastButton extends StatefulWidget {
  final String? text;
  final Widget? icon;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final Color? color;

  const FastButton({
    super.key,
    this.text,
    this.icon,
    this.isLoading = false,
    this.onPressed,
    this.borderRadius,
    this.color,
  }) : assert(text != null || icon != null);

  @override
  State<FastButton> createState() => _FastButtonState();
}

class _FastButtonState extends State<FastButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Colors.blue;

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(16),
        duration: const Duration(milliseconds: 50),
        curve: Curves.fastEaseInToSlowEaseOut,
        decoration: BoxDecoration(
          color: isPressed ? color.darken().withAlpha((0.2 * 255).toInt()) : color.withAlpha((0.2 * 255).toInt()),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
        ),
        child: Center(
            child: widget.isLoading
                ? SizedBox(
                    width: 27,
                    height: 27,
                    child: CircularProgressIndicator(color: color),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      if (widget.text != null)
                        Text(
                          widget.text!,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: isPressed ? color.darken() : color,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                        ),
                      if (widget.icon != null) widget.icon!,
                    ],
                  )),
      ),
    );
  }
}
