import 'package:catur/features/chess/helpers/chess_helper.dart';
import 'package:catur/features/chess/models/chess_model.dart';
import 'package:catur/features/chess/repositories/chess_repository.dart';
import 'package:catur/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chess_event.dart';
part 'chess_state.dart';

class ChessBloc extends Bloc<ChessEvent, ChessState> {
  ChessBloc({required this.chessRepository}) : super(const ChessState()) {
    on<ChessInitial>(_onChessInitial);
    on<ChessTapped>(_onChessTapped);
    on<ChessMoved>(_onChessMoved);
    on<ChessRespawned>(_onChessRespawned);
  }

  final ChessRepository chessRepository;

  void _onChessInitial(ChessInitial event, Emitter<ChessState> emit){
    List<List<ChessModel?>> tiles = List.generate(8, (_) => List.filled(8, null));
    for(var chess in ChessHelper.chess){
      tiles[chess.initial[0]][chess.initial[1]] = chess;
    }

    emit(state.copyWith(
      status: ChessStatus.initial,
      isPlayerTurn: true,
      tiles: tiles,
      whitePieces: <ChessModel>[],
      blackPieces: <ChessModel>[],
      tilesOn: <List<int>>[],
      respawnedPosition: <int>[],
      chess: () => null
    ));
  }

  void _onChessTapped(ChessTapped event, Emitter<ChessState> emit){
    List<List<int>> tilesOn = state.tilesOn;
    tilesOn.clear();

    switch(event.chess.type){
      case ChessType.pawn:
        tilesOn.addAll(chessRepository.pawnMoveset(state.tiles, event.chess.color, state.isPlayerTurn, event.chess.initial, event.position, state.whitePieces, state.blackPieces));
        break;
      case ChessType.rook:
        tilesOn.addAll(chessRepository.rookMoveset(state.tiles, event.chess.color, state.isPlayerTurn, event.position));
        break;
      case ChessType.knight:
        tilesOn.addAll(chessRepository.knightMoveset(state.tiles, event.chess.color, state.isPlayerTurn, event.position));
        break;
      case ChessType.bishop:
        tilesOn.addAll(chessRepository.bishopMoveset(state.tiles, event.chess.color, state.isPlayerTurn, event.position));
        break;
      case ChessType.queen:
        tilesOn.addAll(chessRepository.queenMoveset(state.tiles, event.chess.color, state.isPlayerTurn, event.position));
        break;
      case ChessType.king:
        tilesOn.addAll(chessRepository.kingMoveset(state.tiles, event.chess.color, state.isPlayerTurn, event.position));
        break;
      default:
        break;
    }

    emit(state.copyWith(
      tilesOn: state.tilesOn,
      chess: () => event.chess
    ));
  }

  void _onChessMoved(ChessMoved event, Emitter<ChessState> emit){
    ChessStatus status = state.status;
    final tiles = state.tiles;
    final whitePieces = state.whitePieces;
    final blackPieces = state.blackPieces;
    ChessModel chess = state.chess!;
    List<int> respawnedPosition = state.respawnedPosition;
    final row = event.position[0];
    final col = event.position[1];
    ChessModel? pieces = tiles[row][col];

    status = ChessStatus.progressed;

    if(!listEquals(event.position, chess.position)){
      //kondisi posisi awal
      tiles[chess.position[0]][chess.position[1]] = null;

      //piece chess yang sudah dimakan
      if(tiles[row][col] != null){
        if(tiles[row][col]!.type != ChessType.pawn){
          if(tiles[row][col]!.color == ChessColor.white){
            whitePieces.add(pieces!);
          }else{
            blackPieces.add(pieces!);
          }
        }
      }

      //kondisi posisi baru
      chess.position = <int>[row, col];
      tiles[row][col] = chess;

      //kondisi ketika pawn diujung
      if(pieces != null){
        if(pieces.type == ChessType.king){
          status = ChessStatus.finished;
        }else{
          if(chess.type == ChessType.pawn){
            if(chess.color == ChessColor.white){
              if(row == 0){
                status = ChessStatus.dialogWhite;
                respawnedPosition = <int>[row, col];
              }
            }else{
              if(row == 7){
                status = ChessStatus.dialogBlack;
                respawnedPosition = <int>[row, col];
              }
            }
          }
        }
      }

      emit(state.copyWith(
          status: status,
          tiles: tiles,
          whitePieces: whitePieces,
          blackPieces: blackPieces,
          tilesOn: <List<int>>[],
          isPlayerTurn: !state.isPlayerTurn,
          respawnedPosition: respawnedPosition,
          chess: () => null
      ));
    }
  }

  void _onChessRespawned(ChessRespawned event, Emitter<ChessState> emit){
    ChessModel chess = event.chess;
    List<ChessModel> whitePieces = state.whitePieces;
    List<ChessModel> blackPieces = state.blackPieces;
    final tiles = state.tiles;
    List<int> respawnedPosition = state.respawnedPosition;

    if(chess.color == ChessColor.white){
      whitePieces.remove(chess);
    }else{
      blackPieces.remove(chess);
    }

    //kondisi posisi awal
    tiles[respawnedPosition[0]][respawnedPosition[1]] = null;

    //kondisi posisi baru
    chess.position = <int>[respawnedPosition[0], respawnedPosition[1]];
    tiles[respawnedPosition[0]][respawnedPosition[1]] = chess;

    emit(state.copyWith(
      status: ChessStatus.progressed,
      whitePieces: whitePieces,
      blackPieces: blackPieces,
      tiles: tiles,
      respawnedPosition: <int>[]
    ));
  }
}
