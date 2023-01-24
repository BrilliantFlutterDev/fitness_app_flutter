import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';

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
      for (int i = 0; i < constants.dailyExercises.length; i++) {
        exerciseModelLocalDB = ExerciseModelLocalDB(
            image: constants.dailyExercises[i].image,
            name: constants.dailyExercises[i].name,
            time: constants.dailyExercises[i].time,
            raps: constants.dailyExercises[i].raps,
            type: constants.dailyExercises[i].type,
            kneeIssue: constants.dailyExercises[i].kneeIssue,
            planLevel: constants.dailyExercises[i].planLevel,
            inPushUpCat: constants.dailyExercises[i].inPushUpCat,
            inPlankCat: constants.dailyExercises[i].inPlankCat,
            dayTitle: constants.dailyExercises[i].dayTitle,
            completeStatus: '0',);
        await dbHelper.insertExercise(exerciseModelLocalDB.toJson());
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

        yield GetAllExerciseState(exerciseData: exerciseData);
      } catch (e) {
        yield ErrorState(error: 'No Exercise found!');
      }
    } else if (event is GetAllExerciseOfDayEvent) {
      yield LoadingState();

      try {
        var data = await dbHelper.queryAllExerciseOfDay(event.day);
        RequestExerciseData exerciseData = RequestExerciseData.fromJson(data);

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
    else if (event is RapsTimeIncrementDecrementEvent) {
      try {
        if (event.isIncrementing == true) {
          event.exerciseModelLocalDB.raps =
              event.exerciseModelLocalDB.raps + 1;
        } else {
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
