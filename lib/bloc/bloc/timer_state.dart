part of 'timer_bloc.dart';

class TimerState extends Equatable {
  int milliseconds;
  int seconds;
  int minutes;
  int hours;
  bool isRunning;
  TimerState(
      {this.milliseconds = 0,
      this.seconds = 0,
      this.minutes = 0,
      this.hours = 0,
      this.isRunning = false});

  TimerState copywith(
      {int? milliseconds,
      int? seconds,
      int? minutes,
      int? hours,
      bool? isRunning}) {
    return TimerState(
        milliseconds: milliseconds ?? this.milliseconds,
        seconds: seconds ?? this.seconds,
        minutes: minutes ?? this.minutes,
        hours: hours ?? this.hours,
        isRunning: isRunning ?? this.isRunning);
  }

  @override
  List<Object> get props => [milliseconds, seconds, minutes, hours, isRunning];
}
