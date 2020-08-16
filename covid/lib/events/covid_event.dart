import 'package:equatable/equatable.dart';

abstract class CovidEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CovidEventRequest extends CovidEvent {}

class CovidEventRefresh extends CovidEvent {}
