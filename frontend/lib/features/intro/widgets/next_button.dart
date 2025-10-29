import 'package:flutter/material.dart';

class _BtnColors {
  static const outer = Color(0xFF19A55A);
  static const active = Color(0xFF0D6E3E);
}

class NextButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String label;

  const NextButton({super.key, this.onTap, this.label = 'Next'});

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Returns the animated color for a given segment index (0..count-1),
  // smoothly blending from white to active during its time slice.
  Color _colorForSegment(double t, int index, {int count = 3}) {
    final x = t * count; // which segment are we in overall
    final current = x.floor() % count; // active segment index
    final phase = x - x.floor(); // 0..1 within the active segment

    final h =
        current == index ? Curves.easeInOut.transform(phase) : 0.0;
    return Color.lerp(Colors.white, _BtnColors.active, h) ??
        Colors.white;
  }

  Widget _dot({double size = 8, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 170,
          decoration: BoxDecoration(
            color: _BtnColors.outer,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.only(
            left: 20,
            top: 10,
            bottom: 10,
            // right: 10,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Nunito',
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),

              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: SizedBox(
                  height: 40,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (_, __) {
                      final t = _controller.value;
                      final c1 = _colorForSegment(t, 0);
                      final c2 = _colorForSegment(t, 1);
                      final c3 = _colorForSegment(t, 2);

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _dot(color: c1),
                          const SizedBox(width: 8),
                          _dot(color: c2),
                          Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 40,
                              color: c3,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
