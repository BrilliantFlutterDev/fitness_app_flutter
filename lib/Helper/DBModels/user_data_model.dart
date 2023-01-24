class RequestUserData {
  List<UserDataModelLocalDB>? userDataList;

  RequestUserData({required this.userDataList});

  RequestUserData.fromJson(List<Map<String, dynamic>> json) {
    userDataList = <UserDataModelLocalDB>[];
    for (var v in json) {
      userDataList!.add(UserDataModelLocalDB.fromJson(v));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userDataList != null) {
      data['UserData'] = userDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDataModelLocalDB {
  // late  int completedPercentage;
  // late  int exerciseNumInProgress;

  late final String? gender;
  late final String? dateOfBirth;
  late final String? weight;
  late final String? height;
  late final int? countDownTime;
  late final int? trainingRest;
  late final bool? turnOnWaterTracker;
  late final bool? drinkNotification;

  UserDataModelLocalDB({
    // required this.completedPercentage,
    // required this.exerciseNumInProgress,

    this.gender,
    this.dateOfBirth,
    this.weight,
    this.height,
    this.countDownTime,
    this.trainingRest,
    this.turnOnWaterTracker,
    this.drinkNotification,
  });

  UserDataModelLocalDB.fromJson(Map<String, dynamic> json) {
    // completedPercentage = json['completeExercisePercentage'];
    // exerciseNumInProgress = json['exerciseNumInProgress'];

    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    weight = json['weight'];
    height = json['height'];
    countDownTime = json['countDownTime'];
    trainingRest = json['trainingRest'];
    turnOnWaterTracker = json['turnOnWaterTracker'];
    drinkNotification = json['drinkNotification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['completeExercisePercentage'] = completedPercentage;
    // data['exerciseNumInProgress'] = exerciseNumInProgress;

    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['weight'] = weight;
    data['height'] = height;
    data['countDownTime'] = countDownTime;
    data['trainingRest'] = trainingRest;
    data['turnOnWaterTracker'] = turnOnWaterTracker;
    data['drinkNotification'] = drinkNotification;

    return data;
  }
}
