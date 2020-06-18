import 'package:bloc_theming/business_logic/infinite_list/post_bloc.dart';
import 'package:bloc_theming/business_logic/theme/theme_bloc.dart';
import 'package:bloc_theming/business_logic/counter/counter_bloc.dart';
import 'package:bloc_theming/business_logic/timer/timer_bloc.dart';
import 'package:bloc_theming/data/post/post_repository.dart';
import 'package:bloc_theming/data/timer/ticker.dart';
import 'package:bloc_theming/presentation/home/home_page.dart';
import 'package:bloc_theming/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // register all the service
  await setUpServices();
  // run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => TimerBloc(ticker: Ticker()),
        ),
        BlocProvider(
          create: (context) =>
              PostBloc(postRepository: PostRepository())..add(PostFetched()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _app,
      ),
    );
  }

  Widget _app(BuildContext context, ThemeState state) {
    return MaterialApp(
      title: 'Material App',
      theme: state.themeData,
      home: HomePage(),
    );
  }
}
