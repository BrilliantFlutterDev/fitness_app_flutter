import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:bloc/bloc.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:meta/meta.dart';

import '../../../Helper/db_helper.dart';
import '../../../constants/constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(ProductInitial());
  final dbHelper = DatabaseHelper.instance;
  ExerciseConstants constants = ExerciseConstants();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
     if (event is InsertAllExercisesInLocalDBEvent) {
    yield LoadingState();

    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    ExerciseModelLocalDB exerciseModelLocalDB;
    for(int i=0;i<constants.dailyExercises.length;i++){
      exerciseModelLocalDB=ExerciseModelLocalDB(image: constants.dailyExercises[i].image, name: constants.dailyExercises[i].name, time: constants.dailyExercises[i].time, raps: constants.dailyExercises[i].raps, type: constants.dailyExercises[i].type, kneeIssue: constants.dailyExercises[i].kneeIssue, planLevel: constants.dailyExercises[i].planLevel, inPushUpCat: constants.dailyExercises[i].inPushUpCat, inPlankCat: constants.dailyExercises[i].inPlankCat, dayTitle: constants.dailyExercises[i].dayTitle, completeStatus: '0');
      await dbHelper
          .insertExercise(exerciseModelLocalDB.toJson());
    }
    // UserProductClickLocalDB userProductClickLocalDB =
    // UserProductClickLocalDB(
    //     productID: event.id, uniqueNumber: timeStamp);
    // print(
    //     '>>>>>>>>>Saving data to UserClick to Local DB ${userProductClickLocalDB.productID}');
    // await dbHelper
    //     .insertProductUserClick(userProductClickLocalDB.toJson());
    yield RefreshScreenState();
    }
     else if(event is RefreshScreenEvent){
       yield RefreshScreenState();
     }
     else if(event is GetAllExerciseEvent){
       yield LoadingState();

       try {
         var data = await dbHelper.queryAllExercise();
         RequestExerciseData exerciseData =
         RequestExerciseData.fromJson(data);

         yield GetAllExerciseState(
             exerciseData: exerciseData);
       } catch (e) {
         yield ErrorState(error: 'No Exercise found!');
       }
     }
  }
}
