import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  static const String routeName = '/nav';

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: const Duration(seconds: 0),
        pageBuilder: (BuildContext context, Animation<double> animDouble1,
            Animation<double> animDouble2) {
          return NavScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Nav Screen'),
    );
  }
}
