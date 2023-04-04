class DayModel {
  final String name;
  final String image;
  // final String kneeIssue;
  // final String planLevel;
  final String completeStatus;
  final int noOfGlassWaterDrank;
  final double completedPercentage;
  final int exerciseNumInProgress;
  final int isRest;
  DayModel({required this.image, required this.name, required this.completedPercentage, required this.completeStatus, required this.noOfGlassWaterDrank, required this.exerciseNumInProgress, this.isRest = 0});
}
