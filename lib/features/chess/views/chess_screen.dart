import 'package:catur/features/chess/bloc/chess_bloc.dart';
import 'package:catur/utils/app_theme.dart';
import 'package:catur/utils/injector.dart';
import 'package:catur/utils/utils.dart';
import 'package:catur/utils/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChessScreen extends StatelessWidget{
  const ChessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: injector<ChessBloc>()..add(ChessInitial()),
      child: Scaffold(
        body: _chessBody(),
      ),
    );
  }

  Widget _chessBody(){
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
        child: BlocConsumer<ChessBloc, ChessState>(
            builder: (context, state){
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Wrap(
                      children: _chessTilesList(state),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _chessText(state),
                        ElevatedButton(
                          onPressed: () => injector<ChessBloc>().add(ChessInitial()),
                          child: Text(
                            "Restart Game",
                            style: GoogleFonts.plusJakartaSans(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
            listener: (context, state){
              if(state.status == ChessStatus.dialogWhite && state.whitePieces.isNotEmpty){
                CustomDialog.chessDialog(context, state.whitePieces);
              }

              if(state.status == ChessStatus.dialogBlack && state.blackPieces.isNotEmpty){
                CustomDialog.chessDialog(context, state.blackPieces);
              }
            }
        ),
      ),
    );
  }

  List<Widget> _chessTilesList(ChessState state){
    List<Widget> list = <Widget>[];

    for(int i = 0; i < state.tiles.length; i++){
      for(int j = 0; j < state.tiles[i].length; j++){
        list.add(_chessTilesItem(i, j, state));
      }
    }

    return list;
  }

  Widget _chessTilesItem(int row, int col, ChessState state){
    return GestureDetector(
      onTap: (){
        if(state.tiles[row][col] != null){
          if(listContains(state.tilesOn, [row, col])){
            injector<ChessBloc>().add(ChessMoved(<int>[row, col]));
          }else{
            if(state.status != ChessStatus.finished){
              injector<ChessBloc>().add(ChessTapped(<int>[row, col], state.tiles[row][col]!));
            }
          }
        }else{
          if(state.chess != null && listContains(state.tilesOn, [row, col])){
            injector<ChessBloc>().add(ChessMoved(<int>[row, col]));
          }
        }
      },
      child: Container(
        width: 11.75.w,
        height: 5.875.h,
        color: listContains(state.tilesOn, [row, col]) ? AppTheme.greenColor : _chessTilesColor(row, col, state),
        child: Center(
          child: _chessTilesContent(row, col, state),
        ),
      ),
    );
  }

  Widget _chessTilesContent(int row, int index2, ChessState state){
    if(state.tiles[row][index2] != null){
      return state.tiles[row][index2]!.isAlive ? Image.asset(state.tiles[row][index2]!.chessImage, width: 6.w, height: 3.h,) : const SizedBox();
    }else{
      return const SizedBox();
    }
  }

  Color _chessTilesColor(int row, int col, ChessState state){
    if(row % 2 == 0){
      return col % 2 == 0 ? AppTheme.brownColor : AppTheme.darkBrownColor;
    }else{
      return col % 2 == 0 ? AppTheme.darkBrownColor : AppTheme.brownColor;
    }
  }

  Widget _chessText(ChessState state){
    if(state.status != ChessStatus.finished){
      return Text(
        state.isPlayerTurn ? "White Turn" : "Black Turn",
        style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, fontSize: 20.sp),
        textAlign: TextAlign.center,
      );
    }else{
      return Text(
        state.isPlayerTurn ? "White Win" : "Black Win",
        style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, fontSize: 20.sp),
        textAlign: TextAlign.center,
      );
    }
  }
}