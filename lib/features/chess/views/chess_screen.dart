import 'package:catur/features/chess/bloc/chess_bloc.dart';
import 'package:catur/features/chess/models/chess_model.dart';
import 'package:catur/utils/app_theme.dart';
import 'package:catur/utils/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ChessBloc, ChessState>(
              builder: (context, state){
                return Wrap(
                  children: _chessTilesList(state),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _chessTilesList(ChessState state){
    List<Widget> list = <Widget>[];

    for(int i = 0; i < state.tiles.length; i++){
      list.add(_chessTilesItem(i, state));
    }

    return list;
  }

  Widget _chessTilesItem(int index, ChessState state){
    return GestureDetector(
      onTap: (){
        if(state.tiles[index] != null){
          if(state.isPlayerTurn){
            if(state.tiles[index]!.color == ChessColor.white){
              injector<ChessBloc>().add(ChessTapped(index, state.tiles[index]!));
            }
          }else{
            if(state.tiles[index]!.color == ChessColor.black){
              injector<ChessBloc>().add(ChessTapped(index, state.tiles[index]!));
            }
          }
        }else{
          if(state.chess != null && state.tilesOn.contains(index)){
            injector<ChessBloc>().add(ChessMoved(index));
          }
        }
      },
      child: Container(
        width: 11.75.w,
        height: 5.875.h,
        color: state.tilesOn.contains(index) ? AppTheme.greenColor : _chessTilesColor(index, state),
        child: Center(
          child: _chessTilesContent(index, state),
        ),
      ),
    );
  }

  Widget _chessTilesContent(int index, ChessState state){
    if(state.tiles[index] != null){
      return state.tiles[index]!.isAlive ? Image.asset(state.tiles[index]!.chessImage, width: 6.w, height: 3.h,) : const SizedBox();
    }else{
      return const SizedBox();
    }
  }

  Color _chessTilesColor(int index, ChessState state){
    if(index ~/ 8 % 2 == 0){
      return index % 2 == 0 ? AppTheme.brownColor : AppTheme.darkBrownColor;
    }else{
      return index % 2 == 0 ? AppTheme.darkBrownColor : AppTheme.brownColor;
    }
  }
}