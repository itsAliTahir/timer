part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class StartTimerEvent extends TimerEvent {}

class ResetTimerEvent extends TimerEvent {}
