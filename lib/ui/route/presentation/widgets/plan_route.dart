import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../widgets/build_text_field.dart';

class PlanRoute extends StatelessWidget {
  const PlanRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Plan Your Route",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          BuildTextField(
            controller: TextEditingController(),
            hint: "From: New York",
            icon: Iconsax.location_outline,
          ),
          const SizedBox(height: 12),
          BuildTextField(
            controller: TextEditingController(),
            hint: "To: Washington DC",
            icon: Iconsax.location_outline,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF10B981),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.send, size: 18),
                        SizedBox(width: 20,),
                        const Text("Find Routes"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                },
                icon: const Icon(Icons.refresh),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.grey.shade200),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
