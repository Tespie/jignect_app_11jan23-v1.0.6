// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Login widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginEvent extends Equatable {}

/// Event that is dispatched when the Login widget is first created.
class LoginInitialEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends LoginEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

// tj added
class LoginApiEvent extends LoginEvent {
  LoginApiEvent({
    this.onLoginApiSuccessEvent,
    this.onLoginApiErrorEvent,
  });

  Function? onLoginApiSuccessEvent;
  Function? onLoginApiErrorEvent;

  @override
  // TODO: implement props
  List<Object?> get props => [
        onLoginApiSuccessEvent,
        onLoginApiErrorEvent,
      ];
}
