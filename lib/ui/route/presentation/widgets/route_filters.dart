import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kettu/ui/route/provider/route_view_model.dart';
import 'package:kettu/utils/extension_and_enums.dart';
import 'package:provider/provider.dart';

class RouteFilters extends StatelessWidget {
  const RouteFilters({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: const [
              Icon(Icons.filter_alt_outlined, size: 18),
              SizedBox(width: 6),
              Text(
                "Filters",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Transport Type
          const Text(
            "Transport Type",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              FilterChip(
                padding: EdgeInsets.symmetric(horizontal: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                label: Text("Car",style: TextStyle(color: context.watch<RouteViewModel>().vehicleList.contains(VehicleTypeEnum.car)?Colors.white:Colors.black),),
                selectedColor: Color(0xFF10B981),
                avatar: const Icon(Icons.directions_car, size: 18),
                selected: context.watch<RouteViewModel>().vehicleList.contains(VehicleTypeEnum.car),
                onSelected: (_) {
                  context.read<RouteViewModel>().changeVehicle(VehicleTypeEnum.car);
                },
                showCheckmark: false,
              ),
              FilterChip(
                padding: EdgeInsets.symmetric(horizontal: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                label: Text("Bus",style: TextStyle(color: context.watch<RouteViewModel>().vehicleList.contains(VehicleTypeEnum.bus)?Colors.white:Colors.black),),
                avatar: const Icon(Icons.directions_bus, size: 18),
                selected: context.watch<RouteViewModel>().vehicleList.contains(VehicleTypeEnum.bus),
                onSelected: (_) {
                  context.read<RouteViewModel>().changeVehicle(VehicleTypeEnum.bus);
                },
                selectedColor: Color(0xFF10B981),
                showCheckmark: false,
              ),
              FilterChip(
                padding: EdgeInsets.symmetric(horizontal: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                label: Text("Train",style: TextStyle(color: context.watch<RouteViewModel>().vehicleList.contains(VehicleTypeEnum.train)?Colors.white:Colors.black),),
                avatar: const Icon(Icons.train, size: 18),
                selected: context.watch<RouteViewModel>().vehicleList.contains(VehicleTypeEnum.train),
                onSelected: (_) {
                  context.read<RouteViewModel>().changeVehicle(VehicleTypeEnum.train);
                },
                selectedColor: Color(0xFF10B981),
                showCheckmark: false,
              ),
              FilterChip(
                padding: EdgeInsets.symmetric(horizontal: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                label: Text("Flight",style: TextStyle(color: context.watch<RouteViewModel>().vehicleList.contains(VehicleTypeEnum.flight)?Colors.white:Colors.black),),
                selectedColor: Color(0xFF10B981),
                avatar: const Icon(Icons.flight, size: 18),
                showCheckmark: false,
                selected: context.watch<RouteViewModel>().vehicleList.contains(VehicleTypeEnum.flight),
                onSelected: (_) {
                  context.read<RouteViewModel>().changeVehicle(VehicleTypeEnum.flight);
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Price Range
          const Text(
            "Price Range",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: const Text("Under \$100"),
                selected: false,
                onSelected: (_) {},
              ),
              ChoiceChip(
                label: const Text("\$100 - \$300"),
                selected: false,
                onSelected: (_) {},
              ),
              ChoiceChip(
                label: const Text("\$300+"),
                selected: false,
                onSelected: (_) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
