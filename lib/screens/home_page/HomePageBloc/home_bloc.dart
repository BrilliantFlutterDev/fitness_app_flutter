import 'dart:async';
import 'dart:convert';
import 'dart:io';

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

      if(AppGlobal.selectedPlan=='1') {
        for (int i = 0; i < constants.BeginnerExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.BeginnerExercises[i].time,
            raps: constants.BeginnerExercises[i].raps,
            kneeIssue: constants.BeginnerExercises[i].kneeIssue,
            planLevel: constants.BeginnerExercises[i].planLevel,
            inPushUpCat: constants.BeginnerExercises[i].inPushUpCat,
            inPlankCat: constants.BeginnerExercises[i].inPlankCat,
            dayTitle: constants.BeginnerExercises[i].dayTitle,
            exerciseID: constants.BeginnerExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='2') {
        for (int i = 0; i < constants.IntermediateExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.IntermediateExercises[i].time,
            raps: constants.IntermediateExercises[i].raps,
            kneeIssue: constants.IntermediateExercises[i].kneeIssue,
            planLevel: constants.IntermediateExercises[i].planLevel,
            inPushUpCat: constants.IntermediateExercises[i].inPushUpCat,
            inPlankCat: constants.IntermediateExercises[i].inPlankCat,
            dayTitle: constants.IntermediateExercises[i].dayTitle,
            exerciseID: constants.IntermediateExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else if(AppGlobal.selectedPlan=='3') {
        for (int i = 0; i < constants.AdvancedExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.AdvancedExercises[i].time,
            raps: constants.AdvancedExercises[i].raps,
            kneeIssue: constants.AdvancedExercises[i].kneeIssue,
            planLevel: constants.AdvancedExercises[i].planLevel,
            inPushUpCat: constants.AdvancedExercises[i].inPushUpCat,
            inPlankCat: constants.AdvancedExercises[i].inPlankCat,
            dayTitle: constants.AdvancedExercises[i].dayTitle,
            exerciseID: constants.AdvancedExercises[i].exercise_id,
            completeStatus: '0',);
          await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
        }
      }
      else{
        for (int i = 0; i < constants.BeginnerExercises.length; i++) {
          exerciseModelLocalDB = ExerciseModelLocalDB(
            time: constants.BeginnerExercises[i].time,
            raps: constants.BeginnerExercises[i].raps,
            kneeIssue: constants.BeginnerExercises[i].kneeIssue,
            planLevel: constants.BeginnerExercises[i].planLevel,
            inPushUpCat: constants.BeginnerExercises[i].inPushUpCat,
            inPlankCat: constants.BeginnerExercises[i].inPlankCat,
            dayTitle: constants.BeginnerExercises[i].dayTitle,
            exerciseID: constants.BeginnerExercises[i].exercise_id,
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
          type: constants.AllExercises[i].type,
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
            kneeIssue: dayConstants.days[i].kneeIssue,
            planLevel: dayConstants.days[i].planLevel,
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
    } else if (event is RefreshScreenEvent) {
      yield RefreshScreenState();
    } else if (event is GetAllExerciseEvent) {
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
    } else if (event is GetAllExerciseOfDayEvent) {
      yield LoadingState();

      try {
        var data = await dbHelper.queryAllExerciseOfDay(event.day);
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
    } else if (event is GetAllDaysEvent) {
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
        yield ErrorState(error: 'No Exercise found!');
      }
    }
    else if (event is ChangeExerciseStatusToUnDoneEvent) {
      try {
        event.exerciseModelLocalDB.completeStatus = '0';

        var data =
        await dbHelper.updateAExercise(event.exerciseModelLocalDB.toJson());

        yield UpdateAllExerciseState(exerciseModelLocalDB: event.exerciseModelLocalDB);
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
  }
}
