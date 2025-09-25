import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kettu/ui/map/presentation/map_screen.dart';
import 'package:kettu/utils/extension_and_enums.dart';
import 'package:page_transition/page_transition.dart';

class RouteViewModel extends ChangeNotifier {
  List<VehicleTypeEnum> vehicleList = [
    VehicleTypeEnum.flight,
    VehicleTypeEnum.train,
    VehicleTypeEnum.car,
    VehicleTypeEnum.bus,
  ];

  int routeItemIndex = 0;


  void changeVehicle(VehicleTypeEnum value) {
    if (vehicleList.contains(value)) {
      vehicleList.remove(value);
    } else {
      vehicleList.add(value);
    }
    notifyListeners();
  }

  void selectRoute(int index) {
    routeItemIndex = index;
    print(routeItemIndex);
    notifyListeners();
  }

  void openMapScren(BuildContext context) {
    context.pushReplacementTransition(
      type: PageTransitionType.bottomToTop,
      child: MapScreen(),
    );
  }

}