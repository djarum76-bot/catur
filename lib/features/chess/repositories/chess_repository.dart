import 'package:catur/features/chess/models/chess_model.dart';

abstract class ChessRepository{
  List<List<int>> pawnMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> initial, List<int> position, List<ChessModel> whitePieces, List<ChessModel> blackPieces);
  List<List<int>> rookMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position);
  List<List<int>> knightMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position);
  List<List<int>> bishopMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position);
  List<List<int>> queenMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position);
  List<List<int>> kingMoveset(List<List<ChessModel?>> tiles, ChessColor color, bool isPlayerTurn, List<int> position);
}