import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/bloc/bloc/timer_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
                  final hours = (state.milliseconds ~/ 3600000)
                      .toString()
                      .padLeft(2, '0');
                  final minutes = ((state.milliseconds % 3600000) ~/ 60000)
                      .toString()
                      .padLeft(2, '0');
                  final seconds = ((state.milliseconds % 60000) ~/ 1000)
                      .toString()
                      .padLeft(2, '0');
                  final milliseconds = ((state.milliseconds % 1000) ~/ 10)
                      .toString()
                      .padLeft(2, '0');
                  return Text(
                    '$hours:$minutes:$seconds:$milliseconds',
                    style: const TextStyle(fontSize: 40),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<TimerBloc, TimerState>(
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              context.read<TimerBloc>().add(ResetTimerEvent());
                            },
                            icon: const Icon(
                              Icons.restore,
                              color: Colors.black,
                            ));
                      },
                    ),
                    BlocBuilder<TimerBloc, TimerState>(
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              context.read<TimerBloc>().add(StartTimerEvent());
                            },
                            icon: Icon(
                              Icons.timer,
                              color:
                                  state.isRunning ? Colors.blue : Colors.black,
                            ));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
