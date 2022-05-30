import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_timer_cubit_my_default/ticker.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final Ticker _ticker;
  static const int _initialStateDuration = 60;
  static const int _completeStateDuration = 0;

  StreamSubscription<int>? _tickerSubscription;

  TimerCubit({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitialState(_initialStateDuration));

  void onStarted() {
    emit(TimerRunInProgressState(state.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: state.duration)
        .listen((eventDuration) => onTicked(duration: eventDuration));
  }

  void onPaused() {
    if (state is TimerRunInProgressState) {
      emit(TimerRunPauseState(state.duration));
      _tickerSubscription?.pause();
    }
  }

  void onResumed() {
    if (state is TimerRunPauseState) {
      emit(TimerRunInProgressState(state.duration));
      _tickerSubscription?.resume();
    }
  }

  void onReset() {
    emit(const TimerInitialState(_initialStateDuration));
    _tickerSubscription?.cancel();
  }

  void onTicked({required int duration}) {
    /// works `right` by using duration > 0
    duration > 0
        ? emit(TimerRunInProgressState(duration))
        : emit(const TimerRunCompleteState(_completeStateDuration));

    // /// works `wrong` by using state.duration > 0
    // state.duration > 0
    //     ? emit(TimerRunInProgressState(duration))
    //     : emit(const TimerRunCompleteState(_completeStateDuration));

    log('onTick method | duration : $duration');
    log('onTick method | state.duration : ${state.duration}');
    log('onTick method | state : $state');
  }
}
