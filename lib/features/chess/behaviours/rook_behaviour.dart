import 'package:catur/features/chess/models/chess_model.dart';

class RookBehaviour{
  List<List<int>> rookAvailableMove(List<List<ChessModel?>> tiles, List<int> position, ChessColor color){
    List<List<int>> moveset = <List<int>>[];
    int row = position[0];
    int col = position[1];
    bool isWhite = color == ChessColor.white;
    ChessColor chessColor = isWhite ? ChessColor.black : ChessColor.white;
    moveset.add(position);

    if(row == 7){
      for(int i = 1; i <= 7; i++){
        if(tiles[row - i][col] == null){
          moveset.add(<int>[row - i, col]);
        }else{
          if(tiles[row - i][col]!.color == chessColor){
            moveset.add(<int>[row - i, col]);
          }
          break;
        }
      }
    }

    if(row == 0){
      for(int i = 1; i <= 7; i++){
        if(tiles[row + i][col] == null){
          moveset.add(<int>[row + i, col]);
        }else{
          if(tiles[row + i][col]!.color == chessColor){
            moveset.add(<int>[row + i, col]);
          }
          break;
        }
      }
    }

    if(col == 7){
      for(int i = 1; i <= 7; i++){
        if(tiles[row][col - i] == null){
          moveset.add(<int>[row, col - i]);
        }else{
          if(tiles[row][col - i]!.color == chessColor){
            moveset.add(<int>[row, col - i]);
          }
          break;
        }
      }
    }

    if(col == 0){
      for(int i = 1; i <= 7; i++){
        if(tiles[row][col + i] == null){
          moveset.add(<int>[row, col + i]);
        }else{
          if(tiles[row][col + i]!.color == chessColor){
            moveset.add(<int>[row, col + i]);
          }
          break;
        }
      }
    }

    if(row != 0 && row != 7){
      for(int i = row - 1; i >= 0; i--){
        if(tiles[i][col] == null){
          moveset.add(<int>[i, col]);
        }else{
          if(tiles[i][col]!.color == chessColor){
            moveset.add(<int>[i, col]);
          }
          break;
        }
      }

      for(int i = row + 1; i <= 7; i++){
        if(tiles[i][col] == null){
          moveset.add(<int>[i, col]);
        }else{
          if(tiles[i][col]!.color == chessColor){
            moveset.add(<int>[i, col]);
          }
          break;
        }
      }
    }

    if(col != 0 && col != 7){
      for(int i = col - 1; i >= 0; i--){
        if(tiles[row][i] == null){
          moveset.add(<int>[row, i]);
        }else{
          if(tiles[row][i]!.color == chessColor){
            moveset.add(<int>[row, i]);
          }
          break;
        }
      }

      for(int i = col + 1; i <= 7; i++){
        if(tiles[row][i] == null){
          moveset.add(<int>[row, i]);
        }else{
          if(tiles[row][i]!.color == chessColor){
            moveset.add(<int>[row, i]);
          }
          break;
        }
      }
    }

    return moveset;
  }
}