import 'package:flutter/material.dart';
import 'package:flutter_timer_cubit_my_default/timer_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Timer with Cubit',
      home: TimerPage(),
    );
  }
}
