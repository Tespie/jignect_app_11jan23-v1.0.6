import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jignect_app_11jan23/presentation/intro_screen/models/intro_model.dart';
part 'intro_event.dart';
part 'intro_state.dart';

/// A bloc that manages the state of a Intro according to the event that is dispatched to it.
class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc(IntroState initialState) : super(initialState) {
    on<IntroInitialEvent>(_onInitialize);
  }

  _onInitialize(
    IntroInitialEvent event,
    Emitter<IntroState> emit,
  ) async {}
}
