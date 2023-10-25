enum ChessColor { black, white }
enum ChessType { pawn, rook, knight, bishop, queen, king }

class ChessModel{
  ChessModel({
    required this.id,
    required this.index,
    required this.isAlive,
    required this.color,
    required this.type,
  });

  final int id;
  int index;
  final bool isAlive;
  final ChessColor color;
  final ChessType type;

  String get chessImage => "assets/images/${color.name}_${type.name}.png";
}