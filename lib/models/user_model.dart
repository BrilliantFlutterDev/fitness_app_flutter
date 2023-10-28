class UserModel {
  late final String? gender;
  late final String? dateOfBirth;
  late final String? weight;
  late final String? height;
  late final int? countDownTime;
  late final int? trainingRest;
  late final bool? turnOnWaterTracker;
  late final bool? drinkNotification;
  UserModel({
    this.gender,
    this.dateOfBirth,
    this.weight,
    this.height,
    this.countDownTime = 10,
    this.trainingRest,
    this.turnOnWaterTracker,
    this.drinkNotification,
  });
}