import 'package:flutter/material.dart';



class ParkingVertical extends StatelessWidget {
  final int rows;
  final double slotWidth;
  final double slotHeight;
  final double spacing;
  final BorderRadius borderRadius;
  final List<ParkingSlotData> slots; // Each slot with child, dashed?, color

  const ParkingVertical({
    Key? key,
    this.rows = 3,
    this.slotWidth = 80,
    this.slotHeight = 120,
    this.spacing = 12,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    required this.slots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rows, (r) {
        final data = slots.length > r ? slots[r] : null;
        return Container(
          width: slotWidth,
          height: slotHeight,
          margin: EdgeInsets.only(bottom: r == rows - 1 ? 0 : spacing),
          child: CustomPaint(
            painter: SlotPainter(
              borderRadius: borderRadius,
              dashed: data?.dashed ?? false,
              borderColor: data?.borderColor ?? Colors.white,
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: data?.child ?? const SizedBox.shrink(),
            ),
          ),
        );
      }),
    );
  }
}

class ParkingSlotData {
  final Widget? child;
  final bool dashed;
  final VoidCallback? onTap;
  final Color borderColor;

  ParkingSlotData({
    this.onTap,
    this.child,
    this.dashed = false,
    this.borderColor = Colors.white,
  });
}

  class SlotPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final bool dashed;
  final Color borderColor;

  SlotPainter({
    required this.borderRadius,
    required this.dashed,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndCorners(
      rect,
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = borderColor;

    if (dashed) {
      const dashWidth = 6.0;
      const dashSpace = 4.0;
      final path = Path()..addRRect(rrect);
      final pathMetrics = path.computeMetrics();
      for (final metric in pathMetrics) {
        double distance = 0;
        while (distance < metric.length) {
          final segment = metric.extractPath(distance, distance + dashWidth);
          canvas.drawPath(segment, paint);
          distance += dashWidth + dashSpace;
        }
      }
    } else {
      canvas.drawRRect(rrect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}