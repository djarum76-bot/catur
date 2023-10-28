import 'package:catur/features/chess/behaviours/bishop_behaviour.dart';
import 'package:catur/features/chess/behaviours/king_behaviour.dart';
import 'package:catur/features/chess/behaviours/knight_behaviour.dart';
import 'package:catur/features/chess/behaviours/pawn_behaviour.dart';
import 'package:catur/features/chess/behaviours/queen_behaviour.dart';
import 'package:catur/features/chess/behaviours/rook_behaviour.dart';
import 'package:catur/features/chess/models/chess_model.dart';
import 'package:catur/features/chess/repositories/chess_repository.dart';

class ChessRepositoryImpl extends ChessRepository{
  ChessRepositoryImpl({
    required this.pawnBehaviour,
    required this.rookBehaviour,
    required this.knightBehaviour,
    required this.bishopBehaviour,
    required this.queenBehaviour,
    required this.kingBehaviour,
  });

  final PawnBehaviour pawnBehaviour;
  final RookBehaviour rookBehaviour;
  final KnightBehaviour knightBehaviour;
  final BishopBehaviour bishopBehaviour;
  final QueenBehaviour queenBehaviour;
  final KingBehaviour kingBehaviour;

  @override
  List<List<int>> pawnMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> initial, List<int> position, List<ChessModel> whitePieces, List<ChessModel> blackPieces) {
    List<List<int>> moveset = <List<int>>[];

    if(isPlayerTurn){
      if(color == ChessColor.white){
        moveset = pawnBehaviour.pawnAvailableMove(tiles, initial, position, color);
      }
    }else{
      if(color == ChessColor.black){
        moveset = pawnBehaviour.pawnAvailableMove(tiles, initial, position, color);
      }
    }

    return moveset;
  }

  @override
  List<List<int>> rookMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position) {
    List<List<int>> moveset = <List<int>>[];

    if(isPlayerTurn){
      if(color == ChessColor.white){
        moveset = rookBehaviour.rookAvailableMove(tiles, position, color);
      }
    }else{
      if(color == ChessColor.black){
        moveset = rookBehaviour.rookAvailableMove(tiles, position, color);
      }
    }

    return moveset;
  }

  @override
  List<List<int>> knightMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position) {
    List<List<int>> moveset = <List<int>>[];

    if(isPlayerTurn){
      if(color == ChessColor.white){
        moveset = knightBehaviour.knightAvailableMove(tiles, position, color);
      }
    }else{
      if(color == ChessColor.black){
        moveset = knightBehaviour.knightAvailableMove(tiles, position, color);
      }
    }

    return moveset;
  }

  @override
  List<List<int>> bishopMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position) {
    List<List<int>> moveset = <List<int>>[];

    if(isPlayerTurn){
      if(color == ChessColor.white){
        moveset = bishopBehaviour.bishopAvailableMove(tiles, position, color);
      }
    }else{
      if(color == ChessColor.black){
        moveset = bishopBehaviour.bishopAvailableMove(tiles, position, color);
      }
    }

    return moveset;
  }

  @override
  List<List<int>> queenMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position) {
    List<List<int>> moveset = <List<int>>[];

    if(isPlayerTurn){
      if(color == ChessColor.white){
        moveset = queenBehaviour.queenAvailableMove(tiles, position, color);
      }
    }else{
      if(color == ChessColor.black){
        moveset = queenBehaviour.queenAvailableMove(tiles, position, color);
      }
    }

    return moveset;
  }

  @override
  List<List<int>> kingMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position) {
    List<List<int>> moveset = <List<int>>[];

    if(isPlayerTurn){
      if(color == ChessColor.white){
        moveset = kingBehaviour.kingAvailableMove(tiles, position, color);
      }
    }else{
      if(color == ChessColor.black){
        moveset = kingBehaviour.kingAvailableMove(tiles, position, color);
      }
    }

    return moveset;
  }
}