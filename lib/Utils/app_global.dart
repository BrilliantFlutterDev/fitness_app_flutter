import 'package:intl/intl.dart';

class AppGlobal {
  static String rememberMe = 'false';
  static String rememberMeEmail = '';
  static String rememberMePassword = '';
  static String? dataStoreFromConstantToLDB = '';
  static String? selectedPlan = '1';
  static String? selectedKneeIssueOption = '';
  static String? selectedPushUpOption = '3';
  static String? selectedPlankOption = '15';
  static int currentDay = 0;
  static int pushUp = int.parse(selectedPushUpOption!);
  static int plank = int.parse(selectedPlankOption!);
}
