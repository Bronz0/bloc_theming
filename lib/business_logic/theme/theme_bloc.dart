import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_theming/data/theme/app_theme.dart';
import 'package:bloc_theming/services/theme_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc_theming/services/locator.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeServie _themeService = locator.get<ThemeServie>();
  @override
  ThemeState get initialState {
    final String _themeName = _themeService.retreiveTheme();
    final _themeDataKey = appThemeData.keys.firstWhere(
      // test
      (key) {
        return key.toString() == _themeName ? true : false;
      },
      orElse: () => AppTheme.BlueLight,
    );
    return ThemeState(themeData: appThemeData[_themeDataKey]);
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      _themeService.persistTheme(event.theme.toString());
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }
}
