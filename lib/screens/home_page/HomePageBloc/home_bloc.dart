import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:meta/meta.dart';

import '../../../Helper/db_helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(ProductInitial());
  final dbHelper = DatabaseHelper.instance;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
     if (event is GetLocalCartCombinationDetails) {
    yield LoadingState();

    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    // UserProductClickLocalDB userProductClickLocalDB =
    // UserProductClickLocalDB(
    //     productID: event.id, uniqueNumber: timeStamp);
    // print(
    //     '>>>>>>>>>Saving data to UserClick to Local DB ${userProductClickLocalDB.productID}');
    // await dbHelper
    //     .insertProductUserClick(userProductClickLocalDB.toJson());
    yield ProductClickAddedToLocalDBState();
    }
     else if(event is RefreshScreenEvent){
       yield RefreshScreenState();
     }
  }
}
