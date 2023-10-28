import 'package:catur/features/chess/models/chess_model.dart';

class QueenBehaviour{
  List<List<int>> queenAvailableMove(List<List<ChessModel?>> tiles, List<int> position, ChessColor color){
    List<List<int>> moveset = <List<int>>[];
    int row = position[0];
    int col = position[1];
    bool isWhite = color == ChessColor.white;
    ChessColor chessColor = isWhite ? ChessColor.black : ChessColor.white;
    moveset.add(position);

    List<int> rowMoves = [-1, 0, 1, 1, 1, 0, -1, -1]; // Horizontal, vertical, and diagonal directions
    List<int> colMoves = [-1, -1, -1, 0, 1, 1, 1, 0]; // Horizontal, vertical, and diagonal directions

    // Check all possible moves in all directions
    for (int i = 0; i < 8; i++) {
      int newRow = row;
      int newCol = col;

      // Continue moving in the current direction until reaching the edge of the chessboard
      while (true) {
        newRow += rowMoves[i];
        newCol += colMoves[i];

        // Check if the new position is valid (inside the chessboard)
        if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
          if(tiles[newRow][newCol] == null){
            moveset.add([newRow, newCol]);
          }else{
            if(tiles[newRow][newCol]!.color == chessColor){
              moveset.add([newRow, newCol]);
            }
            break;
          }
        } else {
          // If the new position is outside the chessboard, stop moving in this direction
          break;
        }
      }
    }

    return moveset;
  }
}