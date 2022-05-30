part of 'timer_cubit.dart';

@immutable
abstract class TimerState {
  final int duration;

  const TimerState(this.duration);
}

class TimerInitialState extends TimerState {
  const TimerInitialState(int duration) : super(duration);
}

class TimerRunInProgressState extends TimerState {
  const TimerRunInProgressState(int duration) : super(duration);
}

class TimerRunPauseState extends TimerState {
  const TimerRunPauseState(int duration) : super(duration);
}

class TimerRunCompleteState extends TimerState {
  const TimerRunCompleteState(int duration) : super(duration);
}
