import 'package:bloc_theming/business_logic/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  final CounterBloc _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Counter"),
        ),
        body: BlocBuilder<CounterBloc, int>(
          bloc: _counterBloc,
          builder: (context, count) => Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                heroTag: 'increment_counter',
                child: Icon(Icons.add),
                onPressed: () {
                  _counterBloc.add(CounterEvent.increment);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                heroTag: 'decrement_counter',
                child: Icon(Icons.remove),
                onPressed: () {
                  _counterBloc.add(CounterEvent.decrement);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                heroTag: 'reset_counter',
                backgroundColor: Colors.red,
                child: Icon(Icons.replay),
                onPressed: () {
                  _counterBloc.add(CounterEvent.reset);
                },
              ),
            ),
          ],
        ));
  }
}
