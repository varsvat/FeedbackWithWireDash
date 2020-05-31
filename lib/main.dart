import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var _brightness = Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: "feedbackdemoapp-5l8nj4m",
      secret: "bb6sb2o4vi13hzkjir0pr1rgbnprc2dp",
      navigatorKey: _navigatorKey,
      options: WiredashOptionsData(
        showDebugFloatingEntryPoint: true,
      ),
      theme: WiredashThemeData(brightness: _brightness),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        title: 'HomePage',
        theme: ThemeData(brightness: _brightness),
        home: DemoHomePage(
          brightness: _brightness,
          onBrightnessChange: () {
            setState(() {
              if (_brightness == Brightness.light) {
                _brightness = Brightness.dark;
              } else {
                _brightness = Brightness.light;
              }
            });
          },
        ),
      ),
    );
  }
}

class DemoHomePage extends StatelessWidget {
  final Brightness brightness;
  final VoidCallback onBrightnessChange;

  const DemoHomePage(
      {@required this.brightness, @required this.onBrightnessChange, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () => Wiredash.of(context).show(),
          )
        ],
      ),
      body: const Center(
        child: Text(
          'Press the Floating Action Button to change the theme and press on the question mark icon on the top right to give feedback',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onBrightnessChange,
        tooltip: 'Change Brightness',
        child: Icon(Icons.brightness_medium),
      ),
    );
  }
}
