import 'package:catur/features/chess/models/chess_model.dart';

class ChessHelper{
  static List<ChessModel> chess = <ChessModel>[
    blackRook1,
    blackKnight1,
    blackBishop1,
    blackQueen,
    blackKing,
    blackBishop2,
    blackKnight2,
    blackRook2,
    blackPawn1,
    blackPawn2,
    blackPawn3,
    blackPawn4,
    blackPawn5,
    blackPawn6,
    blackPawn7,
    blackPawn8,
    whiteRook1,
    whiteKnight1,
    whiteBishop1,
    whiteQueen,
    whiteKing,
    whiteBishop2,
    whiteKnight2,
    whiteRook2,
    whitePawn1,
    whitePawn2,
    whitePawn3,
    whitePawn4,
    whitePawn5,
    whitePawn6,
    whitePawn7,
    whitePawn8,
  ];

  static ChessModel blackRook1 = ChessModel(id: 0, index: 0, isAlive: true, color: ChessColor.black, type: ChessType.rook);
  static ChessModel blackKnight1 = ChessModel(id: 1, index: 1, isAlive: true, color: ChessColor.black, type: ChessType.knight);
  static ChessModel blackBishop1 = ChessModel(id: 2, index: 2, isAlive: true, color: ChessColor.black, type: ChessType.bishop);
  static ChessModel blackQueen = ChessModel(id: 3, index: 3, isAlive: true, color: ChessColor.black, type: ChessType.queen);
  static ChessModel blackKing = ChessModel(id: 4, index: 4, isAlive: true, color: ChessColor.black, type: ChessType.king);
  static ChessModel blackBishop2 = ChessModel(id: 5, index: 5, isAlive: true, color: ChessColor.black, type: ChessType.bishop);
  static ChessModel blackKnight2 = ChessModel(id: 6, index: 6, isAlive: true, color: ChessColor.black, type: ChessType.knight);
  static ChessModel blackRook2 = ChessModel(id: 7, index: 7, isAlive: true, color: ChessColor.black, type: ChessType.rook);
  static ChessModel blackPawn1 = ChessModel(id: 8, index: 8, isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn2 = ChessModel(id: 9, index: 9, isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn3 = ChessModel(id: 10, index: 10, isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn4 = ChessModel(id: 11, index: 11, isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn5 = ChessModel(id: 12, index: 12, isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn6 = ChessModel(id: 13, index: 13, isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn7 = ChessModel(id: 14, index: 14, isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn8 = ChessModel(id: 15, index: 15, isAlive: true, color: ChessColor.black, type: ChessType.pawn);

  static ChessModel whiteRook1 = ChessModel(id: 56, index: 56, isAlive: true, color: ChessColor.white, type: ChessType.rook);
  static ChessModel whiteKnight1 = ChessModel(id: 57, index: 57, isAlive: true, color: ChessColor.white, type: ChessType.knight);
  static ChessModel whiteBishop1 = ChessModel(id: 58, index: 58, isAlive: true, color: ChessColor.white, type: ChessType.bishop);
  static ChessModel whiteQueen = ChessModel(id: 59, index: 59, isAlive: true, color: ChessColor.white, type: ChessType.queen);
  static ChessModel whiteKing = ChessModel(id: 60, index: 60, isAlive: true, color: ChessColor.white, type: ChessType.king);
  static ChessModel whiteBishop2 = ChessModel(id: 61, index: 61, isAlive: true, color: ChessColor.white, type: ChessType.bishop);
  static ChessModel whiteKnight2 = ChessModel(id: 62, index: 62, isAlive: true, color: ChessColor.white, type: ChessType.knight);
  static ChessModel whiteRook2 = ChessModel(id: 63, index: 63, isAlive: true, color: ChessColor.white, type: ChessType.rook);
  static ChessModel whitePawn1 = ChessModel(id: 48, index: 48, isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn2 = ChessModel(id: 49, index: 49, isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn3 = ChessModel(id: 50, index: 50, isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn4 = ChessModel(id: 51, index: 51, isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn5 = ChessModel(id: 52, index: 52, isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn6 = ChessModel(id: 53, index: 53, isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn7 = ChessModel(id: 54, index: 54, isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn8 = ChessModel(id: 55, index: 55, isAlive: true, color: ChessColor.white, type: ChessType.pawn);
}