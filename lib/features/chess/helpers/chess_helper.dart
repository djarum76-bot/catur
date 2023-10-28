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

  static ChessModel blackRook1 = ChessModel(id: 0, initial: [0,0], position: [0,0], isAlive: true, color: ChessColor.black, type: ChessType.rook);
  static ChessModel blackKnight1 = ChessModel(id: 1, initial: [0,1], position: [0,1], isAlive: true, color: ChessColor.black, type: ChessType.knight);
  static ChessModel blackBishop1 = ChessModel(id: 2, initial: [0,2], position: [0,2], isAlive: true, color: ChessColor.black, type: ChessType.bishop);
  static ChessModel blackQueen = ChessModel(id: 3, initial: [0,3], position: [0,3], isAlive: true, color: ChessColor.black, type: ChessType.queen);
  static ChessModel blackKing = ChessModel(id: 4, initial: [0,4], position: [0,4], isAlive: true, color: ChessColor.black, type: ChessType.king);
  static ChessModel blackBishop2 = ChessModel(id: 5, initial: [0,5], position: [0,5], isAlive: true, color: ChessColor.black, type: ChessType.bishop);
  static ChessModel blackKnight2 = ChessModel(id: 6, initial: [0,6], position: [0,6], isAlive: true, color: ChessColor.black, type: ChessType.knight);
  static ChessModel blackRook2 = ChessModel(id: 7, initial: [0,7], position: [0,7], isAlive: true, color: ChessColor.black, type: ChessType.rook);
  static ChessModel blackPawn1 = ChessModel(id: 8, initial: [1,0], position: [1,0], isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn2 = ChessModel(id: 9, initial: [1,1], position: [1,1], isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn3 = ChessModel(id: 10, initial: [1,2], position: [1,2], isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn4 = ChessModel(id: 11, initial: [1,3], position: [1,3], isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn5 = ChessModel(id: 12, initial: [1,4], position: [1,4], isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn6 = ChessModel(id: 13, initial: [1,5], position: [1,5], isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn7 = ChessModel(id: 14, initial: [1,6], position: [1,6], isAlive: true, color: ChessColor.black, type: ChessType.pawn);
  static ChessModel blackPawn8 = ChessModel(id: 15, initial: [1,7], position: [1,7], isAlive: true, color: ChessColor.black, type: ChessType.pawn);

  static ChessModel whiteRook1 = ChessModel(id: 56, initial: [7,0], position: [7,0], isAlive: true, color: ChessColor.white, type: ChessType.rook);
  static ChessModel whiteKnight1 = ChessModel(id: 57, initial: [7,1], position: [7,1], isAlive: true, color: ChessColor.white, type: ChessType.knight);
  static ChessModel whiteBishop1 = ChessModel(id: 58, initial: [7,2], position: [7,2], isAlive: true, color: ChessColor.white, type: ChessType.bishop);
  static ChessModel whiteQueen = ChessModel(id: 59, initial: [7,3], position: [7,3], isAlive: true, color: ChessColor.white, type: ChessType.queen);
  static ChessModel whiteKing = ChessModel(id: 60, initial: [7,4], position: [7,4], isAlive: true, color: ChessColor.white, type: ChessType.king);
  static ChessModel whiteBishop2 = ChessModel(id: 61, initial: [7,5], position: [7,5], isAlive: true, color: ChessColor.white, type: ChessType.bishop);
  static ChessModel whiteKnight2 = ChessModel(id: 62, initial: [7,6], position: [7,6], isAlive: true, color: ChessColor.white, type: ChessType.knight);
  static ChessModel whiteRook2 = ChessModel(id: 63, initial: [7,7], position: [7,7], isAlive: true, color: ChessColor.white, type: ChessType.rook);
  static ChessModel whitePawn1 = ChessModel(id: 48, initial: [6,0], position: [6,0], isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn2 = ChessModel(id: 49, initial: [6,1], position: [6,1], isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn3 = ChessModel(id: 50, initial: [6,2], position: [6,2], isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn4 = ChessModel(id: 51, initial: [6,3], position: [6,3], isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn5 = ChessModel(id: 52, initial: [6,4], position: [6,4], isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn6 = ChessModel(id: 53, initial: [6,5], position: [6,5], isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn7 = ChessModel(id: 54, initial: [6,6], position: [6,6], isAlive: true, color: ChessColor.white, type: ChessType.pawn);
  static ChessModel whitePawn8 = ChessModel(id: 55, initial: [6,7], position: [6,7], isAlive: true, color: ChessColor.white, type: ChessType.pawn);
}