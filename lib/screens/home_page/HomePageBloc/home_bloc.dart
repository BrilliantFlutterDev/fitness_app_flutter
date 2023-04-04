import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/Utils/app_global.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:meta/meta.dart';

import '../../../Helper/DBModels/day_model.dart';
import '../../../Helper/db_helper.dart';
import '../../../constants/constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(ProductInitial());
  final dbHelper = DatabaseHelper.instance;
  ExerciseConstants constants = ExerciseConstants();
  Constants dayConstants = Constants();

  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is InsertAllExercisesInLocalDBEvent) {
      yield LoadingState();

      String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      ExerciseModelLocalDB exerciseModelLocalDB;

      if(AppGlobal.selectedPlan=='1' && AppGlobal.selectedKneeIssueOption=='1') {
        for (int i = 0; i < constants.BeginnerFineExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.BeginnerFineExercises[i].time,
            raps: constants.BeginnerFineExercises[i].raps,
            // kneeIssue: constants.BeginnerFineExercises[i].kneeIssue,
            // planLevel: constants.BeginnerFineExercises[i].planLevel,
            // inPushUpCat: constants.BeginnerFineExercises[i].inPushUpCat,
            // inPlankCat: constants.BeginnerFineExercises[i].inPlankCat,
            dayTitle: constants.BeginnerFineExercises[i].dayTitle,
            exerciseID: constants.BeginnerFineExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='1' && AppGlobal.selectedKneeIssueOption=='2') {
        for (int i = 0; i < constants.BeginnerNoJumpingExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.BeginnerNoJumpingExercises[i].time,
            raps: constants.BeginnerNoJumpingExercises[i].raps,
            dayTitle: constants.BeginnerNoJumpingExercises[i].dayTitle,
            exerciseID: constants.BeginnerNoJumpingExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='1' && AppGlobal.selectedKneeIssueOption=='3') {
        for (int i = 0; i < constants.BeginnerLowImpactExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.BeginnerLowImpactExercises[i].time,
            raps: constants.BeginnerLowImpactExercises[i].raps,
            dayTitle: constants.BeginnerLowImpactExercises[i].dayTitle,
            exerciseID: constants.BeginnerLowImpactExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='2' && AppGlobal.selectedKneeIssueOption=='1') {
        for (int i = 0; i < constants.IntermediateFineExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.IntermediateFineExercises[i].time,
            raps: constants.IntermediateFineExercises[i].raps,
            dayTitle: constants.IntermediateFineExercises[i].dayTitle,
            exerciseID: constants.IntermediateFineExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='2' && AppGlobal.selectedKneeIssueOption=='2') {
        for (int i = 0; i < constants.IntermediateNoJumpingExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.IntermediateNoJumpingExercises[i].time,
            raps: constants.IntermediateNoJumpingExercises[i].raps,
            dayTitle: constants.IntermediateNoJumpingExercises[i].dayTitle,
            exerciseID: constants.IntermediateNoJumpingExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='2' && AppGlobal.selectedKneeIssueOption=='3') {
        for (int i = 0; i < constants.IntermediateLowImpactExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.IntermediateLowImpactExercises[i].time,
            raps: constants.IntermediateLowImpactExercises[i].raps,
            dayTitle: constants.IntermediateLowImpactExercises[i].dayTitle,
            exerciseID: constants.IntermediateLowImpactExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='3' && AppGlobal.selectedKneeIssueOption=='1') {
        for (int i = 0; i < constants.AdvancedFineExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.AdvancedFineExercises[i].time,
            raps: constants.AdvancedFineExercises[i].raps,
            dayTitle: constants.AdvancedFineExercises[i].dayTitle,
            exerciseID: constants.AdvancedFineExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='3' && AppGlobal.selectedKneeIssueOption=='2') {
        for (int i = 0; i < constants.AdvancedNoJumpingExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.AdvancedNoJumpingExercises[i].time,
            raps: constants.AdvancedNoJumpingExercises[i].raps,
            dayTitle: constants.AdvancedNoJumpingExercises[i].dayTitle,
            exerciseID: constants.AdvancedNoJumpingExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='3' && AppGlobal.selectedKneeIssueOption=='3') {
        for (int i = 0; i < constants.AdvancedLowImpactExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.AdvancedLowImpactExercises[i].time,
            raps: constants.AdvancedLowImpactExercises[i].raps,
            dayTitle: constants.AdvancedLowImpactExercises[i].dayTitle,
            exerciseID: constants.AdvancedLowImpactExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else{
        for (int i = 0; i < constants.BeginnerFineExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.BeginnerFineExercises[i].time,
            raps: constants.BeginnerFineExercises[i].raps,
            dayTitle: constants.BeginnerFineExercises[i].dayTitle,
            exerciseID: constants.BeginnerFineExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }

      ExerciseDetailModel exerciseDetailModel;
      for (int i = 0; i < constants.AllExercises.length; i++) {
        exerciseDetailModel = ExerciseDetailModel(
          id: constants.AllExercises[i].id,
          name: constants.AllExercises[i].name,
          image: constants.AllExercises[i].image,
          // video: constants.AllExercises[i].video,
          type: constants.AllExercises[i].type,
          rapTime: constants.AllExercises[i].rapTime,
          kcal: constants.AllExercises[i].kcal,
          description: constants.AllExercises[i].description,
        );
        await dbHelper.insertExerciseDetail(exerciseDetailModel.toJson());
      }

      DayModelLocalDB dayModelLocalDB;
      for (int i = 0; i < dayConstants.days.length; i++) {
        dayModelLocalDB = DayModelLocalDB(
            image: dayConstants.days[i].image,
            name: dayConstants.days[i].name,
            completedPercentage: dayConstants.days[i].completedPercentage,
            // kneeIssue: dayConstants.days[i].kneeIssue,
            // planLevel: dayConstants.days[i].planLevel,
            completeStatus: dayConstants.days[i].completeStatus,
            noOfGlassWaterDrank: dayConstants.days[i].noOfGlassWaterDrank,
            exerciseNumInProgress:  dayConstants.days[i].exerciseNumInProgress,
            isRest: dayConstants.days[i].isRest
        );
        print('>>>>>>>Exerxise detail store in DB');
        await dbHelper.insertDays(dayModelLocalDB.toJson());
      }

      await storage.write(key: 'dataStoreFromConstantToLDB', value: 'true');
      final date = DateTime.now();
      print('>>>>>>>Date: $date');
      await storage.write(key: 'startDate', value: date.toString());
      // UserProductClickLocalDB userProductClickLocalDB =
      // UserProductClickLocalDB(
      //     productID: event.id, uniqueNumber: timeStamp);
      // print(
      //     '>>>>>>>>>Saving data to UserClick to Local DB ${userProductClickLocalDB.productID}');
      // await dbHelper
      //     .insertProductUserClick(userProductClickLocalDB.toJson());
      yield DataStoredState();
    }
    else if (event is RefreshScreenEvent) {
      yield RefreshScreenState();
    }
    else if (event is GetAllExerciseEvent) {
      yield LoadingState();

      try {
        var data = await dbHelper.queryAllExercise();
        RequestExerciseData exerciseData = RequestExerciseData.fromJson(data);

        for(int i=0;i< exerciseData.exerciseList!.length; i++){
          var mExercise = await dbHelper.queryASpecificExercise(exerciseData.exerciseList![i].exerciseID);
          exerciseData.exerciseList![i].exercise = ExerciseDetailModel.fromJson(mExercise[0]);
          print(exerciseData);
        }

        yield GetAllExerciseState(exerciseData: exerciseData);
      } catch (e) {
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is GetAllExerciseOfDayEvent) {
      yield LoadingState();

      try {
        var data = await dbHelper.queryAllExerciseOfDay(event.day);
        RequestExerciseData exerciseData = RequestExerciseData.fromJson(data);
        for(int i=0; i< exerciseData.exerciseList!.length; i++){
          var mExercise = await dbHelper.queryASpecificExercise(exerciseData.exerciseList![i].exerciseID);
          exerciseData.exerciseList![i].exercise = ExerciseDetailModel.fromJson(mExercise[0]);
          print(exerciseData);
        }

        double calories = 0.0;
        for(int index=0; index<exerciseData.exerciseList!.length; index++){
          print('Exercise Length>>>> ${exerciseData.exerciseList!.length}');
          double cal1 = exerciseData.exerciseList![index].exercise.type == 'time'?
          exerciseData.exerciseList![index].exercise.kcal * exerciseData.exerciseList![index].time.toDouble() :
          exerciseData.exerciseList![index].exercise.kcal * exerciseData.exerciseList![index].raps.toDouble();
          print('Calories>>> $cal1');
          calories = calories + cal1;
          print('Calories $calories');
        }

        double totalTime = 0.0;
        for(int index=0; index<exerciseData.exerciseList!.length; index++){
          print('Exercise Length>>>> ${exerciseData.exerciseList!.length}');
          double time1 = exerciseData.exerciseList![index].exercise.type == 'time'?
          exerciseData.exerciseList![index].time.toDouble() :
          exerciseData.exerciseList![index].exercise.rapTime * exerciseData.exerciseList![index].raps.toDouble();

          totalTime = totalTime + time1;
        }
        totalTime = totalTime/60;

        yield GetAllExerciseState(exerciseData: exerciseData, calories: calories, totalTime: totalTime);
      } catch (e) {
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is SwapAExerciseOfDayEvent) {
    yield LoadingState();

    try {
      var data = await dbHelper.queryAllExerciseOfDay(event.day);
      RequestExerciseData exerciseData = RequestExerciseData.fromJson(data);
      for(int i=0; i< exerciseData.exerciseList!.length; i++){

        var mExercise = await dbHelper.queryASpecificExercise(exerciseData.exerciseList![i].exerciseID);
        exerciseData.exerciseList![event.oldIndex].exercise = ExerciseDetailModel.fromJson(mExercise[0]);
        exerciseData.exerciseList![event.oldIndex].exercise = exerciseData.exerciseList![event.newIndex].exercise;
        print(exerciseData);
    }
    yield GetAllExerciseState(exerciseData: exerciseData);
      } catch (e) {
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is GetAllDaysEvent) {
      yield LoadingState();

      try {
        var data = await dbHelper.queryAllDay();
        RequestDayData dayData = RequestDayData.fromJson(data);

        yield GetAllDaysState(dayData: dayData);
      } catch (e) {
        yield ErrorState(error: 'No Days found!');
      }
    }
    else if (event is RapsIncrementDecrementEvent) {
      try {
        if (event.isIncrementing == true) {
          event.exerciseModelLocalDB.raps =
              event.exerciseModelLocalDB.raps + 1;
        } else if (event.isDecrementing == true) {
          event.exerciseModelLocalDB.raps =
              event.exerciseModelLocalDB.raps - 1;
        }
        var data =
        await dbHelper.updateAExercise(event.exerciseModelLocalDB.toJson());

        yield UpdateAllExerciseState(exerciseModelLocalDB: event.exerciseModelLocalDB);
      } catch (e) {
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is TimeIncrementDecrementEvent) {
      try {
        if (event.isIncrementing == true) {
          event.exerciseModelLocalDB.time =
              event.exerciseModelLocalDB.time + 1;
        } else if (event.isDecrementing == true) {
          event.exerciseModelLocalDB.time =
              event.exerciseModelLocalDB.time - 1;
        }
        var data =
        await dbHelper.updateAExercise(event.exerciseModelLocalDB.toJson());

        yield UpdateAllExerciseState(exerciseModelLocalDB: event.exerciseModelLocalDB);
      } catch (e) {
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is ChangeExerciseStatusToDoneEvent) {
      try {
        event.exerciseModelLocalDB.completeStatus = '1';

        var data =
        await dbHelper.updateAExercise(event.exerciseModelLocalDB.toJson());

        yield UpdateAllExerciseState(exerciseModelLocalDB: event.exerciseModelLocalDB);
      } catch (e) {
        print("Error State: $e");
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is ChangeExerciseStatusToUnDoneEvent) {
      try {
        event.exerciseModelLocalDB.completeStatus = '0';

        var data =
        await dbHelper.updateAExercise(event.exerciseModelLocalDB.toJson());

        yield ReverseExerciseState(exerciseModelLocalDB: event.exerciseModelLocalDB);
      } catch (e) {
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is ChangeExerciseStatusToResetEvent) {
      try {
        // event.exerciseModelLocalDB.completeStatus = '0';

        var data =
        await dbHelper.resetExerciseStatus();
        print("STATUS Updated with Value $data");

        // yield UpdateAllExerciseState(exerciseModelLocalDB: event.exerciseModelLocalDB);
      } catch (e) {
        print("Exception $e");
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is ClearExerciseEvent) {
      try {

        var data = await dbHelper.clearExercise();
        print("Clear Table Value $data");
      } catch (e) {
        print("Exception $e");
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is RemoveDaysEvent) {
      try {

        var data = await dbHelper.removeDays();
        print("Remove Days $data");
      } catch (e) {
        print("Exception $e");
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is DeleteExerciseInADayEvent) {
      try {
        event.exerciseData.exerciseList![event.index].dayTitle='';


        var data =
        await dbHelper.updateAExercise(event.exerciseData.exerciseList![event.index].toJson());
        event.exerciseData.exerciseList!.removeAt(event.index);

        yield GetAllExerciseState(exerciseData: event.exerciseData);
      } catch (e) {
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is UpdateDayProgressEvent) {
      try {

          event.dayModelLocalDB.completedPercentage =
             event.progress;
          print('>>>>>>>>>Day Updating');
          print(event.progress);

        var data =
        await dbHelper.updateADay(event.dayModelLocalDB.toJson());

        yield UpdateDayProgressState(dayModelLocalDB: event.dayModelLocalDB);
      } catch (e) {
        yield ErrorState(error: 'No Days found!');
      }
    }
    else if (event is ReverseDayProgressEvent) {
      try {
        event.dayModelLocalDB.completedPercentage = event.progress;
        print('>>>>>>>>>Day Updating');
        print(event.progress);

        var data =
        await dbHelper.updateADay(event.dayModelLocalDB.toJson());

        yield ReverseDayProgressState(dayModelLocalDB: event.dayModelLocalDB);
      } catch (e) {
        yield ErrorState(error: 'No Days found!');
      }
    }
    else if (event is WaterGlassIncrementDecrementEvent) {
      try {
        if (event.isIncrementing == true) {
          event.dayData.exerciseList![0].noOfGlassWaterDrank =
              event.dayData.exerciseList![0].noOfGlassWaterDrank + 1;
        } else {
          event.dayData.exerciseList![0].noOfGlassWaterDrank =
              event.dayData.exerciseList![0].noOfGlassWaterDrank - 1;
        }
        var data =
        await dbHelper.updateADay(event.dayData.exerciseList![0].toJson());

        yield GetAllDaysState(dayData: event.dayData);
      } catch (e) {
        yield ErrorState(error: 'No Days found!');
      }
    }
  }
}
