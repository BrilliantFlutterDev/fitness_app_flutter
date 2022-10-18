class DayModel {
  final String name;
  final String image;
  final String kneeIssue;
  final String planLevel;
  final String completeStatus;
  final int noOfGlassWaterDrank;
  final int completedPercentage;
  final int exerciseNumInProgress;
  DayModel({
    required this.image,
    required this.name,
    required this.completedPercentage,
    required this.kneeIssue,
    required this.planLevel,
    required this.completeStatus,
    required this.noOfGlassWaterDrank,
    required this.exerciseNumInProgress,
  });
}
