import 'package:covid/blocs/covid_bloc.dart';
import 'package:covid/states/covid_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter.dart';

class CovidStatistic extends StatelessWidget {
  final bool codeArea;
  final String nameArea;
  CovidStatistic({Key key, @required this.nameArea, @required this.codeArea})
      : assert(nameArea != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CovidBloc, CovidState>(
      builder: (context, covidState) {
        if (covidState is CovidStateInitilal) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (covidState is CovidStateSuccess) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                        title: "Ca nhiễm",
                        color: Colors.orange,
                        number: this.codeArea
                            ? covidState.covidArea.global.cases
                            : covidState.covidArea.vietnam.cases,
                      ),
                      Counter(
                        title: "Tử vong",
                        color: Colors.red,
                        number: this.codeArea
                            ? covidState.covidArea.global.deaths
                            : covidState.covidArea.vietnam.deaths,
                      ),
                      Counter(
                        title: "Khỏi",
                        color: Colors.green,
                        number: this.codeArea
                            ? covidState.covidArea.global.recovered
                            : covidState.covidArea.vietnam.recovered,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
        if (covidState is CovidStateFailure) {
          return Center(
            child: Text("Lỗi"),
          );
        }
        return Center(
          child: Text("Đang có lỗi gì đó !!!"),
        );
      },
    );
  }
}
