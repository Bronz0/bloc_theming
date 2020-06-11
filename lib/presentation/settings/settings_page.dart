import 'package:bloc_theming/business_logic/theme/theme_bloc.dart';
import 'package:bloc_theming/data/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Themes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: Colors.grey[500],
            height: MediaQuery.of(context).size.width * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(8.0),
              itemCount: AppTheme.values.length,
              itemBuilder: (context, index) {
                final itemAppTheme = AppTheme.values[index];
                return ThemeItem(itemAppTheme: itemAppTheme);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeItem extends StatelessWidget {
  const ThemeItem({
    Key key,
    @required this.itemAppTheme,
  }) : super(key: key);

  final AppTheme itemAppTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appThemeData[itemAppTheme].primaryColor,
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height,
          color: appThemeData[itemAppTheme].canvasColor,
          child: Column(
            children: <Widget>[
              // appbar mock
              Container(
                padding: EdgeInsets.all(5.0),
                color: appThemeData[itemAppTheme].primaryColor,
                child: Center(
                  child: Text(
                    itemAppTheme.toString().split('.')[1],
                    style: appThemeData[itemAppTheme].textTheme.body1,
                  ),
                ),
              ),
              // body mock
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Hello!',
                    style: appThemeData[itemAppTheme].textTheme.display1,
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          BlocProvider.of<ThemeBloc>(context)
              .add(ThemeChanged(theme: itemAppTheme));
        },
      ),
    );
  }
}
