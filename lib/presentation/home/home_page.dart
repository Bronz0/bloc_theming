import 'package:bloc_theming/presentation/counter/counter_page.dart';
import 'package:bloc_theming/presentation/infinite_list/intinite_list_page.dart';
import 'package:bloc_theming/presentation/settings/settings_page.dart';
import 'package:bloc_theming/presentation/timer/timer_page.dart';
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
              child: Text("Home Page",
                  style: Theme.of(context).textTheme.headline3),
            ),
            // go to counter page
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
            ),
            // go to timer page
            FloatingActionButton.extended(
              heroTag: 'home_page_to_timer_page',
              label: Text("Timer Page"),
              icon: Icon(Icons.timer),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Timer(),
                ),
              ),
            ),
            // go to list page
            FloatingActionButton.extended(
              heroTag: 'home_page_to_list_page',
              label: Text("List Page"),
              icon: Icon(Icons.list),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InfiniteListPage(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
