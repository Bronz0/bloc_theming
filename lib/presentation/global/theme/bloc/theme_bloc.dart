import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_theming/presentation/global/theme/app_theme.dart';
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
    switch (_themeService.retreiveTheme()) {
      case ("AppTheme.Black"):
        return ThemeState(themeData: appThemeData[AppTheme.Black]);
        break;
      case ("AppTheme.White"):
        return ThemeState(themeData: appThemeData[AppTheme.White]);
        break;
      case ("AppTheme.BlueLight"):
        return ThemeState(themeData: appThemeData[AppTheme.BlueLight]);
        break;
      case ("AppTheme.BleuDark"):
        return ThemeState(themeData: appThemeData[AppTheme.BleuDark]);
        break;
      case ("AppTheme.GreenDark"):
        return ThemeState(themeData: appThemeData[AppTheme.GreenDark]);
        break;
      case ("AppTheme.GreenLight"):
        return ThemeState(themeData: appThemeData[AppTheme.GreenLight]);
        break;
      default:
        return ThemeState(themeData: appThemeData[AppTheme.BlueLight]);
    }
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
