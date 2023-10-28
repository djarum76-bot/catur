import 'package:catur/features/chess/behaviours/bishop_behaviour.dart';
import 'package:catur/features/chess/behaviours/king_behaviour.dart';
import 'package:catur/features/chess/behaviours/knight_behaviour.dart';
import 'package:catur/features/chess/behaviours/pawn_behaviour.dart';
import 'package:catur/features/chess/behaviours/queen_behaviour.dart';
import 'package:catur/features/chess/behaviours/rook_behaviour.dart';
import 'package:catur/features/chess/bloc/chess_bloc.dart';
import 'package:catur/features/chess/repositories/chess_repository.dart';
import 'package:catur/features/chess/repositories/chess_repository_impl.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void injectorSetup() {
  injector.registerSingleton<PawnBehaviour>(PawnBehaviour());
  injector.registerSingleton<RookBehaviour>(RookBehaviour());
  injector.registerSingleton<KnightBehaviour>(KnightBehaviour());
  injector.registerSingleton<BishopBehaviour>(BishopBehaviour());
  injector.registerSingleton<QueenBehaviour>(QueenBehaviour());
  injector.registerSingleton<KingBehaviour>(KingBehaviour());

  injector.registerLazySingleton<ChessRepository>(
    () => ChessRepositoryImpl(
      pawnBehaviour: injector<PawnBehaviour>(),
      rookBehaviour: injector<RookBehaviour>(),
      knightBehaviour: injector<KnightBehaviour>(),
      bishopBehaviour: injector<BishopBehaviour>(),
      queenBehaviour: injector<QueenBehaviour>(),
      kingBehaviour: injector<KingBehaviour>(),
    )
  );

  injector.registerSingleton<ChessBloc>(ChessBloc(chessRepository: injector<ChessRepository>()));
}