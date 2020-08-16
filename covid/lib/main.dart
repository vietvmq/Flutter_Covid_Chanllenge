import 'package:covid/blocs/covid_bloc.dart';
import 'package:covid/blocs/covid_bloc_observer.dart';
import 'package:covid/events/covid_event.dart';
import 'package:covid/repositories/covid_repo.dart';
import 'package:covid/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = CovidBLocObserver();
  final CovidRepo covidRepo = CovidRepo();
  runApp(
    MyApp(
      covidRepo: covidRepo,
    ),
  );
}

class MyApp extends StatelessWidget {
  final CovidRepo covidRepo;
  MyApp({Key key, @required this.covidRepo})
      : assert(covidRepo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // CovidRepo().getCovidStatistic();
    return MaterialApp(
      title: "Covid App",
      home: BlocProvider(
        create: (context) =>
            CovidBloc(covidRepo: this.covidRepo)..add(CovidEventRequest()),
        child: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
