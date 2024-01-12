// ignore_for_file: must_be_immutable

part of 'intro_bloc.dart';

/// Represents the state of Intro in the application.
class IntroState extends Equatable {
  IntroState({this.introModelObj});

  IntroModel? introModelObj;

  @override
  List<Object?> get props => [
        introModelObj,
      ];
  IntroState copyWith({IntroModel? introModelObj}) {
    return IntroState(
      introModelObj: introModelObj ?? this.introModelObj,
    );
  }
}
