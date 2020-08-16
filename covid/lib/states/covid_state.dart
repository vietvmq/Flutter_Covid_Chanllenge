import 'package:covid/models/covid.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CovidState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CovidStateInitilal extends CovidState {}

class CovidStateLoading extends CovidState {}

class CovidStateSuccess extends CovidState {
  final CovidArea covidArea;
  CovidStateSuccess({@required this.covidArea}) : assert(covidArea != null);

  @override
  // TODO: implement props
  List<Object> get props => [covidArea];
}

class CovidStateFailure extends CovidState {}
