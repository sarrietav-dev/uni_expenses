class SettingContext {
  bool isDoubleRide;
  double busPrice;

  SettingContext({
    required this.isDoubleRide,
    required this.busPrice,
  });

  static fromJson({required Map<String, dynamic> object}) {
    return SettingContext(
      isDoubleRide: object["isDoubleRide"],
      busPrice: object["busPrice"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "isDoubleRide": isDoubleRide,
      "busPrice": busPrice,
    };
  }
}
