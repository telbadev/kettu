
import 'package:flutter/material.dart';
import 'package:kettu/widgets/parking_cart.dart';

class ParkingGrid extends StatelessWidget {
  final int count; // nechta slot
  final double slotWidth;
  final double slotHeight;
  final List<ParkingSlotData> slots;

  const ParkingGrid({
    Key? key,
    required this.count,
    this.slotWidth = 80,
    this.slotHeight = 120,
    required this.slots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // har qatorda 3 ta slot
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.7, // balandlik/eni nisbatini sozlash
      ),
      itemCount: count,
      itemBuilder: (context, index) {
        final data = slots.length > index ? slots[index] : null;
        return GestureDetector(
          onTap: data?.onTap,
          child: CustomPaint(
            painter: SlotPainter(
              borderRadius: BorderRadius.circular(12),
              dashed: data?.dashed ?? false,
              borderColor: data?.borderColor ?? Colors.black45,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  data?.child ?? const SizedBox.shrink(),
                  Positioned(
                    top: 0,
                    child: Text(
                    "${index + 1}",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
          ),
          ),
        );
      },
    );
  }
}
