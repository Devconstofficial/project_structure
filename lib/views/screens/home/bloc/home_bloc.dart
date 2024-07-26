import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inner_journal_app/views/screens/home/model/meal_model.dart';
import 'package:pedometer_2/pedometer_2.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/permission_handler.dart';
import '../model/heart_beat_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {


  HomeBloc() : super(HomeState.initial()) {


    on<HomeEvent>((event, emit) async{
      await event.map(
          loadHomeScreen: (_) async {
            emit(state.copyWith(
              homeLoadingBlocStatus: HomeLoadingBlocStatus.isSuccess,
              totalWalkedSteps: _.stepCountStreamFrom
            ));


          },
          updateFocusedDate: (_) async {
            emit(state.copyWith(
                focusedDate: _.focusedDate
            ));
          },
          updateBottomNavigationIndex: (_) async {
            emit(state.copyWith(
              currentIndex: _.index
            ));
          }
      );
    });
  }


}
