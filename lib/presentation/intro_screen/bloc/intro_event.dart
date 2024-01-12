// ignore_for_file: must_be_immutable

part of 'intro_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Intro widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class IntroEvent extends Equatable {}

/// Event that is dispatched when the Intro widget is first created.
class IntroInitialEvent extends IntroEvent {
  @override
  List<Object?> get props => [];
}
