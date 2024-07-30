import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerState()) {
    on<StartTimerEvent>(_startTimer);
    on<ResetTimerEvent>(_resetTimer);
  }

  void _startTimer(StartTimerEvent event, Emitter<TimerState> emit) async {
    bool run = !state.isRunning;
    emit(state.copywith(isRunning: run));

    while (run) {
      await Future.delayed(Duration(milliseconds: 1));
      final newMilliseconds = state.milliseconds + 2;
      final newSeconds = (newMilliseconds / 1000).toInt();
      final newMinutes = (newMilliseconds / 60000).toInt();
      final newHours = (newMilliseconds / 3600000).toInt();

      emit(state.copywith(
        milliseconds: newMilliseconds,
        seconds: newSeconds,
        minutes: newMinutes,
        hours: newHours,
      ));

      if (!state.isRunning) {
        break;
      }
    }
  }

  void _resetTimer(ResetTimerEvent event, Emitter<TimerState> emit) {
    emit(state.copywith(
        isRunning: false, hours: 0, milliseconds: 0, seconds: 0, minutes: 0));
  }
}
