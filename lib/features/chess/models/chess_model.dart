enum ChessColor { black, white }
enum ChessType { pawn, rook, knight, bishop, queen, king }

class ChessModel{
  ChessModel({
    required this.id,
    required this.initial,
    required this.position,
    required this.isAlive,
    required this.color,
    required this.type,
  });

  final int id;
  final List<int> initial;
  List<int> position;
  final bool isAlive;
  final ChessColor color;
  final ChessType type;

  String get chessImage => "assets/images/${color.name}_${type.name}.png";
}