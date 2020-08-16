import 'package:covid/events/covid_event.dart';
import 'package:covid/models/covid.dart';
import 'package:covid/repositories/covid_repo.dart';
import 'package:covid/states/covid_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final CovidRepo covidRepo;
  CovidBloc({@required this.covidRepo})
      : assert(covidRepo != null),
        super(CovidStateInitilal());

  @override
  Stream<CovidState> mapEventToState(CovidEvent covidEvent) async* {
    if (covidEvent is CovidEventRequest) {
      yield CovidStateLoading();
      try {
        final CovidArea covidArea = await this.covidRepo.getCovidStatistic();
        yield CovidStateSuccess(covidArea: covidArea);
      } catch (exception) {
        yield CovidStateFailure();
      }
    } else if (covidEvent is CovidEventRefresh) {
      try {
        final CovidArea covidArea = await this.covidRepo.getCovidStatistic();
        yield CovidStateSuccess(covidArea: covidArea);
      } catch (exception) {
        yield CovidStateFailure();
      }
    }
  }
}
