import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/utils/slide_gradient.dart';

class NeonButton extends StatefulWidget {
  final Duration cycle;
  final double width;
  final double height;
  final List<Color> colors;
  final Widget? child;
  final double borderThickness;
  final Color? backgroundColor;
  final double? borderRadius;
  final bool showGlow;
  final double blurAmount;

  const NeonButton({
    super.key,
    required this.width,
    required this.height,
    required this.colors,
    this.cycle = const Duration(milliseconds: 500),
    this.child,
    this.borderThickness = 3,
    this.backgroundColor,
    this.borderRadius,
    this.showGlow = false,
    this.blurAmount = 15,
  });

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();

    _colors = [...widget.colors, widget.colors.first];

    controller = AnimationController(
      duration: widget.cycle,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = widget.height / widget.width;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) => Stack(
          alignment: Alignment.center,
          children: [
            if (widget.showGlow)
              ClipRRect(
                child: SizedBox(
                  width: widget.width + widget.blurAmount * 3,
                  height: widget.height + widget.blurAmount * 3,
                  child: Center(
                    child: Container(
                      width: widget.width,
                      height: widget.height,
                      padding: EdgeInsets.all(widget.borderThickness),
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
                        gradient: LinearGradient(
                          tileMode: TileMode.repeated,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          transform: SlideGradient(
                            controller.value,
                            widget.height * aspectRatio,
                          ),
                          colors: _colors,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: widget.blurAmount, sigmaY: widget.blurAmount),
                        child: Container(),
                      ),
                    ),
                  ),
                ),
              ),
            Container(
              width: widget.width,
              height: widget.height,
              padding: EdgeInsets.all(widget.borderThickness),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
                gradient: LinearGradient(
                  tileMode: TileMode.repeated,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: SlideGradient(
                    controller.value,
                    widget.height * aspectRatio,
                  ),
                  colors: _colors,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: widget.borderRadius != null
                      ? BorderRadius.circular(widget.borderRadius! - widget.borderThickness)
                      : null,
                ),
                child: widget.child,
              ),
            ),
          ],
        ),
    );
  }
}
