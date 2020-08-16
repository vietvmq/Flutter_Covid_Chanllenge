import 'package:flutter_bloc/flutter_bloc.dart';

class CovidBLocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print("onEvent: $bloc $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print("onTrasition: $bloc $transition");
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(cubit, error, stackTrace);
    print("onError: $error");
  }
}
