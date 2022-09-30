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

    try {
    var data = await dbHelper.queryAllCartProductCombination();
    // print(data);
    // RequestUserCartProductsCombinations
    // requestUserCartProductsCombinations =
    // RequestUserCartProductsCombinations.fromJson(data);
    //
    // yield CartCombinationDetailsLocalDBState(
    // requestUserCartProductsCombinations:
    // requestUserCartProductsCombinations);
    } catch (e) {
    yield ErrorState(error: 'No data found!');
    print(e.toString());
    }
    }
     else if(event is RefreshScreenEvent){
       yield RefreshScreenState();
     }
  }
}
