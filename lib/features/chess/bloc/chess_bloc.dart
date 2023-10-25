import 'package:catur/features/chess/helpers/chess_helper.dart';
import 'package:catur/features/chess/models/chess_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chess_event.dart';
part 'chess_state.dart';

class ChessBloc extends Bloc<ChessEvent, ChessState> {
  ChessBloc() : super(const ChessState()) {
    on<ChessInitial>(_onChessInitial);
    on<ChessTapped>(_onChessTapped);
    on<ChessMoved>(_onChessMoved);
  }

  void _onChessInitial(ChessInitial event, Emitter<ChessState> emit){
    List<ChessModel?> tiles = List.filled(64, null);
    for(var chess in ChessHelper.chess){
      tiles[chess.id] = chess;
    }

    emit(state.copyWith(
      status: ChessStatus.initial,
      isPlayerTurn: true,
      tiles: tiles,
      tilesOn: <int>[]
    ));
  }

  void _onChessTapped(ChessTapped event, Emitter<ChessState> emit){
    List<int> tilesOn = <int>[];
    tilesOn.add(event.position);

    switch(event.chess.type){
      case ChessType.pawn:
        switch(event.chess.color){
          case ChessColor.white:
            if(event.position == event.chess.id){
              tilesOn.add(event.position - 16);
            }
            tilesOn.add(event.position - 8);
            break;
          default:
            if(event.position == event.chess.id){
              tilesOn.add(event.position + 16);
            }
            tilesOn.add(event.position + 8);
            break;
        }
        break;
      default:
        break;
    }

    emit(state.copyWith(
      tilesOn: tilesOn,
      chess: event.chess
    ));
  }

  void _onChessMoved(ChessMoved event, Emitter<ChessState> emit){
    final tiles = state.tiles;
    ChessModel chess = state.chess!;

    tiles[chess.index] = null;
    chess.index = event.index;
    tiles[event.index] = chess;

    emit(state.copyWith(
      tiles: tiles,
      tilesOn: <int>[],
      isPlayerTurn: !state.isPlayerTurn
    ));
  }
}
