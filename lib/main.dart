import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HiddenMenu(
        child: Container(
          color: Colors.purple,
          child: const MyHomePage(
            title: 'Hidden Menu',
          ),
        ),
      ),
    );
  }
}

class HiddenMenu extends StatefulWidget {
  final Widget child;

  const HiddenMenu({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<HiddenMenu> createState() => _HiddenMenuState();
}

class _HiddenMenuState extends State<HiddenMenu> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            color: Colors.amber,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            width: _open ? constraints.maxWidth / 2 : constraints.maxWidth,
            height: _open ? constraints.maxHeight / 2 : constraints.maxHeight,
            left: _open ? 150 : 0,
            top: _open ? 200 : 0,
            child: widget.child,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _open = !_open;
              });
            },
            child: const Text('Toggle'),
          ),
        ],
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
