import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'themeblock_event.dart';
part 'themeblock_state.dart';

class ThemeblockBloc extends Bloc<ThemeblockEvent, ThemeblockState> {
  ThemeblockBloc() : super(ThemeblockInitial()) {
    on<ThemeblockEvent>((event, emit) {
    });
  }
}
