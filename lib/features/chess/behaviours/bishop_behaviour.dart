import 'package:catur/features/chess/models/chess_model.dart';

class BishopBehaviour{
  List<List<int>> bishopAvailableMove(List<List<ChessModel?>> tiles, List<int> position, ChessColor color){
    List<List<int>> moveset = <List<int>>[];
    int row = position[0];
    int col = position[1];
    bool isWhite = color == ChessColor.white;
    ChessColor chessColor = isWhite ? ChessColor.black : ChessColor.white;
    moveset.add(position);

    List<int> rowMoves = [-1, -1, 1, 1];
    List<int> colMoves = [-1, 1, -1, 1];

    for (int i = 0; i < 4; i++) {
      int newRow = row;
      int newCol = col;

      while (true) {
        newRow += rowMoves[i];
        newCol += colMoves[i];

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
          break;
        }
      }
    }

    return moveset;
  }
}