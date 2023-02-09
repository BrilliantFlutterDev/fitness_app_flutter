class RequestExerciseData {
  List<ExerciseModelLocalDB>? exerciseList;

  RequestExerciseData({required this.exerciseList});

  RequestExerciseData.fromJson(List<Map<String, dynamic>> json) {
    exerciseList = <ExerciseModelLocalDB>[];
    for (var v in json) {
      exerciseList!.add(ExerciseModelLocalDB.fromJson(v));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exerciseList != null) {
      data['ExerciseData'] =
          exerciseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExerciseModelLocalDB {
  late final int? columnsId;
  late final String name;
  late final String image;
  late String dayTitle;
  // late final String time;
  late int time;
  late int raps;
  late final String type;
  late final String kneeIssue;
  late final String planLevel;
  late final String inPushUpCat;
  late final String inPlankCat;
  late  String completeStatus;
  late final String discription;
  ExerciseModelLocalDB( {this.columnsId, required this.image, required this.name,required this.time,required  this.raps,required  this.type,required  this.kneeIssue,required  this.planLevel,required  this.inPushUpCat,required  this.inPlankCat,required this.dayTitle,required this.completeStatus,required this.discription});


  ExerciseModelLocalDB.fromJson(Map<String, dynamic> json) {
    columnsId=json['id'];
    dayTitle=json['dayTitle'];
    image = json['image'];
    name = json['name'];
    raps = json['raps'];
    final jsonTime = json['time'];
    if(jsonTime is int){
      time = json['time'];
    }else if(jsonTime is String){
      time = int.parse(json['time']);
    }else{
      print("Time is neither int nor string");
      time = 0;
    }
    // time = int.parse(json['time']);
    type = json['type'];
    kneeIssue = json['kneeIssue'];
    planLevel = json['planLevel'];
    inPushUpCat = json['inPushUpCat'];
    inPlankCat = json['inPlankCat'];
    completeStatus = json['completeStatus'];
    discription = json['discription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = columnsId;
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
    data['discription'] = discription;

    return data;
  }
}