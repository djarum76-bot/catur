import 'package:catur/features/chess/models/chess_model.dart';
import 'package:catur/utils/utils.dart';

class PawnBehaviour{
  List<List<int>> pawnAvailableMove(List<List<ChessModel?>> tiles, List<int> initial, List<int> position, ChessColor color){
    List<List<int>> moveset = <List<int>>[];
    int row = position[0];
    int col = position[1];
    bool isWhite = color == ChessColor.white;
    ChessColor chessColor = isWhite ? ChessColor.black : ChessColor.white;
    moveset.add(position);

    if(listEquals(position, initial)){
      moveset.add(<int>[isWhite ? row - 2 : row + 2, col]);
    }

    if(row == 0 || row == 7){
      return moveset;
    }

    if(tiles[isWhite ? row - 1 : row + 1][col] == null){
      moveset.add(<int>[isWhite ? row - 1 : row + 1, col]);
    }

    if(col != 0){
      if(tiles[isWhite ? row - 1 : row + 1][col - 1] != null && tiles[isWhite ? row - 1 : row + 1][col - 1]!.color == chessColor){
        moveset.add(<int>[isWhite ? row - 1 : row + 1, col - 1]);
      }
    }

    if(col != 7){
      if(tiles[isWhite ? row - 1 : row + 1][col + 1] != null && tiles[isWhite ? row - 1 : row + 1][col + 1]!.color == chessColor){
        moveset.add(<int>[isWhite ? row - 1 : row + 1, col + 1]);
      }
    }

    return moveset;
  }
}