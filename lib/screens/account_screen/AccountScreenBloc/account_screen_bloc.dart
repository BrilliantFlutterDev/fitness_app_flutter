import 'dart:async';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:fitness_app/Helper/DBModels/user_model.dart';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:meta/meta.dart';

import '../../../Helper/DBModels/day_model.dart';
import '../../../Helper/db_helper.dart';
import '../../../constants/constants.dart';

part 'account_screen_event.dart';
part 'account_screen_state.dart';

class AccountScreenBloc extends Bloc<AccountScreenEvent, AccountScreenState> {
  AccountScreenBloc() : super(UserDataInitial());
  final dbHelper = DatabaseHelper.instance;
  ExerciseConstants constants = ExerciseConstants();
  Constants dayConstants = Constants();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Stream<AccountScreenState> mapEventToState(
      AccountScreenEvent event,
  ) async* {
    // if (event is InsertAllUserDataInLocalDBEvent) {
    //   yield LoadingState();
    //
    //   String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    //   UserDataModelLocalDB userDataModelLocalDB;
    //   userDataModelLocalDB = UserDataModelLocalDB(
    //       // completedPercentage: completedPercentage,
    //       // exerciseNumInProgress: dayConstants.days[i].exerciseNumInProgress,
    //       gender: 'gender',
    //       dateOfBirth: '01-01-2000',  //DateTime.now()
    //       weight: 'weight',
    //       height: 'height',
    //       countDownTime: 10,
    //       trainingRest: 20,
    //       turnOnWaterTracker: false,
    //       drinkNotification: false
    //   );
    //   await dbHelper.insertUserData(userDataModelLocalDB.toJson());
    //
    //   await storage.write(key: 'userDataStoreInLDB', value: 'true');
    //   final date = DateTime.now();
    //   print('>>>>>>>Date: $date');
    //   print('>>>>>>>User Data Stored: $date');
    //   await storage.write(key: 'startDate', value: date.toString());
    //   // UserProductClickLocalDB userProductClickLocalDB =
    //   // UserProductClickLocalDB(
    //   //     productID: event.id, uniqueNumber: timeStamp);
    //   // print(
    //   //     '>>>>>>>>>Saving data to UserClick to Local DB ${userProductClickLocalDB.productID}');
    //   // await dbHelper
    //   //     .insertProductUserClick(userProductClickLocalDB.toJson());
    //   yield DataStoredState();
    // }
    // else if (event is RefreshScreenEvent) {
    //   yield RefreshScreenState();
    // }
    // else if (event is GetUserTrainingDataEvent) {
    //   yield LoadingState();
    //   try {
    //     var data = await dbHelper.queryUserTrainingData(event.trainRest);
    //     RequestUserData userDataList = RequestUserData.fromJson(data);
    //     yield GetUserTrainingDataState(userDataList: userDataList);
    //   } catch (e) {
    //     yield ErrorState(error: 'No Exercise found!');
    //   }
    // }
    // else if (event is CountDownEvent) {
    //   try {
    //
    //     event.userModelLocalDB!.countDownTime = event.value;
    //
    //     await dbHelper.updateCountDown(event.userModelLocalDB!.toJson(), event.value);
    //
    //     yield GetCountDownState(userDataModelLocalDB: event.userModelLocalDB! , value: event.value);
    //   } catch (e) {
    //     print(e);
    //     yield ErrorState(error: 'No Data found!');
    //   }
    // }
    if (event is ChangeExerciseStatusToResetEvent) {
      try {
        var data =
        await dbHelper.resetExerciseStatus();
        print("STATUS Updated with Value $data");
      } catch (e) {
        print("Exception $e");
        yield ErrorState(error: 'No Exercise found!');
      }
    }
  }
}