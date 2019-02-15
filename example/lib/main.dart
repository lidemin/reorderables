import 'package:flutter/material.dart';

import './table_example.dart';
import './wrap_example.dart';
import './column_example.dart';
import './row_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reorderables Demo',
      home: MyHomePage(title: 'Reorderables Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _examples = [
    TableExample(),
    WrapExample(),
    ColumnExample(),
    RowExample(),
  ];
  final _bottomNavigationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _examples[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
//        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on, color: _bottomNavigationColor),
            title: Text('ReroderableTable', maxLines: 2, style: TextStyle(color: _bottomNavigationColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps, color: _bottomNavigationColor),
            title: Text('ReroderableWrap', maxLines: 2, style: TextStyle(color: _bottomNavigationColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert, color: _bottomNavigationColor),
            title: Text('ReroderableColumn', maxLines: 2, style: TextStyle(color: _bottomNavigationColor))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: _bottomNavigationColor),
            title: Text('ReroderableRow', maxLines: 2, style: TextStyle(color: _bottomNavigationColor))
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}