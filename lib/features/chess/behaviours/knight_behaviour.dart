import 'package:catur/features/chess/models/chess_model.dart';

class KnightBehaviour{
  List<List<int>> knightAvailableMove(List<List<ChessModel?>> tiles, List<int> position, ChessColor color){
    List<List<int>> moveset = <List<int>>[];
    int row = position[0];
    int col = position[1];
    bool isWhite = color == ChessColor.white;
    ChessColor chessColor = isWhite ? ChessColor.black : ChessColor.white;
    moveset.add(position);

    List<int> rowMoves = [2, 1, -1, -2, -2, -1, 1, 2];
    List<int> colMoves = [1, 2, 2, 1, -1, -2, -2, -1];

    for (int i = 0; i < 8; i++) {
      int newRow = row + rowMoves[i];
      int newCol = col + colMoves[i];

      if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
        if(tiles[newRow][newCol] == null){
          moveset.add([newRow, newCol]);
        }else{
          if(tiles[newRow][newCol]!.color == chessColor){
            moveset.add([newRow, newCol]);
          }
        }
      }
    }

    return moveset;
  }
}