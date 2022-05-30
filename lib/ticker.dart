class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    const period = Duration(seconds: 1);
    return Stream.periodic(
      period,
      (computationCount) => ticks - computationCount - 1,
    ).take(ticks);
  }
}
