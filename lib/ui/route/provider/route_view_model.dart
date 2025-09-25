import 'package:flutter/cupertino.dart';
import 'package:kettu/utils/extension_and_enums.dart';

class RouteViewModel extends ChangeNotifier {
  List<VehicleTypeEnum> vehicleList = [
    VehicleTypeEnum.flight,
    VehicleTypeEnum.train,
    VehicleTypeEnum.car,
    VehicleTypeEnum.bus,
  ];

  int routeItemIndex = 0;


  void changeVehicle(VehicleTypeEnum value) {
    if(vehicleList.contains(value)) {
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

}