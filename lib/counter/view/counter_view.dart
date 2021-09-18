import 'package:counter_bloc/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterChangeName, String>(
            builder: (context, state) {
              return TextButton(
                onPressed: () {
                  String name = isTrue ? "Willys" : "Ester";
                  context.read<CounterChangeName>().changeName(name);
                  isTrue = !isTrue;
                },
                child: Text(
                  "$state",
                  style: TextStyle(fontSize: 30.0),
                ),
              );
            },
          ),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text('$state', style: textTheme.headline2);
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
