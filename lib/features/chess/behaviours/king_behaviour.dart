import 'package:catur/features/chess/models/chess_model.dart';

class KingBehaviour{
  List<List<int>> kingAvailableMove(List<List<ChessModel?>> tiles, List<int> position, ChessColor color){
    List<List<int>> moveset = <List<int>>[];
    int row = position[0];
    int col = position[1];
    bool isWhite = color == ChessColor.white;
    ChessColor chessColor = isWhite ? ChessColor.black : ChessColor.white;
    moveset.add(position);

    List<int> rowMoves = [-1, -1, -1, 0, 0, 1, 1, 1]; // Horizontal, vertical, and diagonal directions
    List<int> colMoves = [-1, 0, 1, -1, 1, -1, 0, 1]; // Horizontal, vertical, and diagonal directions

    // Check all possible moves in all directions
    for (int i = 0; i < 8; i++) {
      int newRow = row + rowMoves[i];
      int newCol = col + colMoves[i];

      // Check if the new position is valid (inside the chessboard)
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