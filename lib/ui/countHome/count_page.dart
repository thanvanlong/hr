import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ui/countHome/bloc/count_bloc.dart';
import 'package:untitled/ui/countHome/bloc/count_event.dart';
import 'package:untitled/ui/countHome/bloc/count_state.dart';


class MyCountPage extends StatefulWidget {
  const MyCountPage({super.key, required this.title});
  final String title;

  @override
  State<MyCountPage> createState() => _MyCountPageState();
}

class _MyCountPageState extends State<MyCountPage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc,CountState>(
              builder: (context, state) {
                if (state is Success) {
                  return Text('${state.count}',style: TextStyle(color: Colors.pink));
                } else {
                  return new CircularProgressIndicator();
                }
              }
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Vũ béo')
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(Increment());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
