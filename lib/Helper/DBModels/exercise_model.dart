class ExerciseModelLocalDB {
  late final String name;
  late final String image;
  late final String dayTitle;
  late final String time;
  late final int raps;
  late final String type;
  late final String kneeIssue;
  late final String planLevel;
  late final bool inPushUpCat;
  late final bool inPlankCat;
  late final String completeStatus;
  ExerciseModelLocalDB( { required this.image, required this.name,required this.time,required  this.raps,required  this.type,required  this.kneeIssue,required  this.planLevel,required  this.inPushUpCat,required  this.inPlankCat,required this.dayTitle,required this.completeStatus,});


  ExerciseModelLocalDB.fromJson(Map<String, dynamic> json) {
    dayTitle=json['dayTitle'];
    image = json['image'];
    name = json['name'];
    raps = json['raps'];
    time = json['time'];
    type = json['type'];
    kneeIssue = json['kneeIssue'];
    planLevel = json['planLevel'];
    inPushUpCat = json['inPushUpCat'];
    inPlankCat = json['inPlankCat'];
    completeStatus= json['completeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['dayTitle'] = dayTitle;
    data['image'] = image;
    data['name'] = name;
    data['raps'] = raps;
    data['time'] = time;
    data['type'] = type;
    data['kneeIssue'] = kneeIssue;
    data['planLevel'] = planLevel;
    data['inPushUpCat'] = inPushUpCat;
    data['inPlankCat'] = inPlankCat;
    data['completeStatus'] = completeStatus;

    return data;
  }
}