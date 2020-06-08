import 'package:bloc_theming/presentation/settings/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // navigate to settings page
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ));
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Text(
            "Home Page",
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}
