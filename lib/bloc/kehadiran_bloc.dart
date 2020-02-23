import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'kehadiran_event.dart';
part 'kehadiran_state.dart';

class KehadiranBloc extends Bloc<KehadiranEvent, KehadiranState> {
  @override
  KehadiranState get initialState => KehadiranInitial();

  @override
  Stream<KehadiranState> mapEventToState(
    KehadiranEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
