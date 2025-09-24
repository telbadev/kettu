import 'package:flutter/cupertino.dart';
import 'package:kettu/utils/extension_and_enums.dart';

class RouteViewModel extends ChangeNotifier {
  List<VehicleTypeEnum> vehicleList = [
    VehicleTypeEnum.flight,
    VehicleTypeEnum.train,
    VehicleTypeEnum.car,
    VehicleTypeEnum.bus,
  ];


  void changeVehicle(VehicleTypeEnum value) {
    if(vehicleList.contains(value)) {
      vehicleList.remove(value);
    } else {
      vehicleList.add(value);
    }
    notifyListeners();
  }

}