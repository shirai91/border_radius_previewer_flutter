import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Border Radius Previewer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Border Radius Previewer'),
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
  RangeValues _topRangeValues = const RangeValues(0, 200);
  RangeValues _bottomRangeValues = const RangeValues(0, 200);
  RangeValues _leftRangeValues = const RangeValues(0, 200);
  RangeValues _rightRangeValues = const RangeValues(0, 200);

  BorderRadiusGeometry _getBorderRadius() {
    return BorderRadius.only(
        topRight: Radius.elliptical(
            2 * (200 - _topRangeValues.end), 2 * _rightRangeValues.start),
        topLeft: Radius.elliptical(
            2 * _topRangeValues.start, 2 * _leftRangeValues.start),
        bottomRight: Radius.elliptical(2 * (200 - _bottomRangeValues.end),
            2 * (200 - _rightRangeValues.end)),
        bottomLeft: Radius.elliptical(
            2 * _bottomRangeValues.start, 2 * (200 - _leftRangeValues.end)));
  }

  String _getLabel(int value) {
    return (value / 2).round().toString() + "%";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: 0,
                left: 70,
                child: Container(
                  width: 250,
                  margin: EdgeInsets.zero,
                  child: RangeSlider(
                      values: _topRangeValues,
                      min: 0,
                      max: 200,
                      divisions: 200,
                      labels: RangeLabels(
                          _getLabel(_topRangeValues.start.round()),
                          _getLabel((200 - _topRangeValues.end).round())),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _topRangeValues = values;
                        });
                      }),
                )),
            Positioned(
                top: 255,
                left: 70,
                child: Container(
                  margin: EdgeInsets.zero,
                  width: 250,
                  child: RangeSlider(
                      values: _bottomRangeValues,
                      min: 0,
                      max: 200,
                      divisions: 200,
                      labels: RangeLabels(
                          _getLabel(_bottomRangeValues.start.round()),
                          _getLabel((200 - _bottomRangeValues.end).round())),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _bottomRangeValues = values;
                        });
                      }),
                )),
            Positioned(
                left: 93,
                top: 25,
                child: Transform(
                  alignment: FractionalOffset.topLeft,
                  transform: new Matrix4.identity()
                    ..rotateZ(90 * 3.1415927 / 180),
                  child: Container(
                    width: 250,
                    child: RangeSlider(
                        values: _leftRangeValues,
                        min: 0,
                        max: 200,
                        divisions: 200,
                        labels: RangeLabels(
                            _getLabel(_leftRangeValues.start.round()),
                            _getLabel((200 - _leftRangeValues.end).round())),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _leftRangeValues = values;
                          });
                        }),
                  ),
                )),
            Positioned(
                left: 343,
                top: 25,
                child: Transform(
                  alignment: FractionalOffset.topLeft,
                  transform: new Matrix4.identity()
                    ..rotateZ(90 * 3.1415927 / 180),
                  child: Container(
                    width: 250,
                    child: RangeSlider(
                        values: _rightRangeValues,
                        min: 0,
                        max: 200,
                        divisions: 200,
                        labels: RangeLabels(
                            _getLabel(_rightRangeValues.start.round()),
                            _getLabel((200 - _rightRangeValues.end).round())),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _rightRangeValues = values;
                          });
                        }),
                  ),
                )),
            Positioned(
                top: 40,
                left: 85,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: _getBorderRadius(), color: Colors.amber),
                ))
          ],
        ),
      ),
    );
  }
}
