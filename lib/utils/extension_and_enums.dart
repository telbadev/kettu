enum VehicleTypeEnum{car,bus,train,flight,nothing }

extension VehicleTypeEnumExtension on VehicleTypeEnum {
  bool get isCar => VehicleTypeEnum.car==this;
  bool get isBus => VehicleTypeEnum.bus==this;
  bool get isTrain => VehicleTypeEnum.train==this;
  bool get isFlight => VehicleTypeEnum.flight==this;
}