import 'package:bloc_theming/presentation/counter/counter_page.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Text(
                "Home Page",
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            FloatingActionButton.extended(
              heroTag: 'home_page_to_counter_page',
              label: Text("Counter Page"),
              icon: Icon(Icons.plus_one),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CounterPage(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
