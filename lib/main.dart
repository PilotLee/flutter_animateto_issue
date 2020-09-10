import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _offsetIndex = 0;
  ScrollController _scrollController;

  void _incrementCounter() {
    if (_offsetIndex == 0) return;
    _offsetIndex--;
    _scrollController.animateTo(
      (_offsetIndex * 300.0),
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void _decrementCounter() {
    if (_offsetIndex == 49) return;
    _offsetIndex++;
    _scrollController.animateTo(
      (_offsetIndex * 300.0),
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemExtent: 300,
            itemCount: 50,
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.white : Colors.grey,
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: _incrementCounter,
          child: Text("up"),
        ),
        GestureDetector(
          onTap: _decrementCounter,
          child: Text("down"),
        ),
      ],
    );
  }
}
