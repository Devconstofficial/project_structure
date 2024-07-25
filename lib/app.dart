
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inner_journal_app/views/screens/home/bloc/home_bloc.dart';
import 'package:inner_journal_app/views/screens/home/screens/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeBloc()),
        ],
        child: const AppView());
  }
}
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView>{

  @override
  Widget build(BuildContext context) {

    return  ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          home: Home()
        );
      }
    );
  }
}


