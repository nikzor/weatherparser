import 'package:flutter/material.dart';
import 'screens/homewidget.dart';
import 'screens/settingswidget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => HomeWidget(),
        '/settings': (_) => SettingsWidget(),
      },
      title: "Weather Bird",
    );
  }
}
