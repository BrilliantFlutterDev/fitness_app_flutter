class RequestDayData {
  List<DayModelLocalDB>? exerciseList;

  RequestDayData({required this.exerciseList});

  RequestDayData.fromJson(List<Map<String, dynamic>> json) {
    exerciseList = <DayModelLocalDB>[];
    for (var v in json) {
      exerciseList!.add(DayModelLocalDB.fromJson(v));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exerciseList != null) {
      data['DayData'] = exerciseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayModelLocalDB {
  late final String name;
  late final String image;
  late final String kneeIssue;
  late final String planLevel;
  late final String completeStatus;
  late int noOfGlassWaterDrank;
  late  int completedPercentage;
  late  int exerciseNumInProgress;
  DayModelLocalDB({
    required this.image,
    required this.name,
    required this.completedPercentage,
    required this.kneeIssue,
    required this.planLevel,
    required this.completeStatus,
    required this.noOfGlassWaterDrank,
    required this.exerciseNumInProgress
  });

  DayModelLocalDB.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['dayTitle'];
    kneeIssue = json['kneeIssue'];
    planLevel = json['planLevel'];
    completeStatus = json['completeStatus'];
    completedPercentage = json['completeExercisePercentage'];
    noOfGlassWaterDrank = json['noOfGlassWaterDrank'];
    exerciseNumInProgress = json['exerciseNumInProgress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['image'] = image;
    data['dayTitle'] = name;
    data['kneeIssue'] = kneeIssue;
    data['planLevel'] = planLevel;
    data['completeStatus'] = completeStatus;
    data['completeExercisePercentage'] = completedPercentage;
    data['noOfGlassWaterDrank'] = noOfGlassWaterDrank;
    data['exerciseNumInProgress'] = exerciseNumInProgress;

    return data;
  }
}
