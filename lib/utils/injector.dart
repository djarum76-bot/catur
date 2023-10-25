import 'package:catur/features/chess/bloc/chess_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void injectorSetup() {
  injector.registerSingleton<ChessBloc>(ChessBloc());
}