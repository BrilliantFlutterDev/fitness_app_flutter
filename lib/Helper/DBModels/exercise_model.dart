import '../db_helper.dart';

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

class ExerciseDetailModel{
  late final int? columnsId;
  late final int id;
  late final String name;
  late final String image;
  // late final String video;
  late final String type;
  late final double rapTime;
  late final double kcal;
  late final String description;

  ExerciseDetailModel( {this.columnsId, required this.id, required this.name, required this.image, required this.type, required this.rapTime, required this.kcal, required this.description,});


  ExerciseDetailModel.fromJson(Map<String, dynamic> json) {
    columnsId=json['id'];
    id=json['exerciseId'];
    image = json['image'];
    // video = json['video'];
    name = json['name'];
    type = json['type'];
    rapTime = json['rapTime'];
    kcal = json['kcal'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = columnsId;
    data['exerciseId'] = id;
    data['image'] = image;
    // data['video'] = video;
    data['name'] = name;
    data['type'] = type;
    data['rapTime'] = rapTime;
    data['kcal'] = kcal;
    data['description'] = description;

    return data;
  }
}

class ExerciseModelLocalDB {
  late final int? columnsId;
  late final int exerciseID;
  late String dayTitle;
  late int time;
  late int raps;
  // late final String kneeIssue;
  // late final String planLevel;
  // late final String inPushUpCat;
  // late final String inPlankCat;
  late String completeStatus;
  late ExerciseDetailModel exercise;
  ExerciseModelLocalDB( {this.columnsId, required this.time, required this.raps, required this.dayTitle,required this.completeStatus, required this.exerciseID});



  ExerciseModelLocalDB.fromJson(Map<String, dynamic> json) {
    columnsId=json['id'];
    exerciseID=json['exerciseId'];

    dayTitle=json['dayTitle'];
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
      // kneeIssue = json['kneeIssue'];
      // planLevel = json['planLevel'];
      // inPushUpCat = json['inPushUpCat'];
      // inPlankCat = json['inPlankCat'];
      completeStatus = json['completeStatus'];
  }

  set index(int index) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = columnsId;
    data['dayTitle'] = dayTitle;
    data['exerciseId'] = exerciseID;
    data['raps'] = raps;
    data['time'] = time;
    // data['kneeIssue'] = kneeIssue;
    // data['planLevel'] = planLevel;
    // data['inPushUpCat'] = inPushUpCat;
    // data['inPlankCat'] = inPlankCat;
    data['completeStatus'] = completeStatus;
    // data['description'] = description;

    return data;
  }
}