import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeuSwitch extends StatefulWidget {
  final Color color;
  final Widget firstChild;
  final Widget secondChild;
  final EdgeInsets padding;

  const NeuSwitch({
    super.key,
    this.color = Colors.white,
    required this.firstChild,
    required this.secondChild,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  State<NeuSwitch> createState() => _NeuSwitchState();
}

class _NeuSwitchState extends State<NeuSwitch> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();

    return Container(
      key: key,
      child: Builder(
        builder: (context) {
          RenderBox? box;
          if (key.currentWidget != null) {
            box = key.currentContext?.findRenderObject() as RenderBox?;
          }

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: widget.padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(box?.size.height ?? 50 / 2),
              color: widget.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 10,
                  offset: _selectedIndex == 0 ? Offset(0, 5) : Offset(50, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTapDown: (_) {
                    setState(() => _selectedIndex = 0);
                    HapticFeedback.lightImpact();
                  },
                  child: widget.firstChild,
                ),
                const SizedBox(width: 8),
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTapDown: (_) {
                    setState(() => _selectedIndex = 1);
                    HapticFeedback.lightImpact();
                  },
                  child: widget.secondChild,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
