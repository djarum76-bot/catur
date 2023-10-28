part of 'chess_bloc.dart';

enum ChessStatus { initial, progressed, dialogWhite, dialogBlack, finished }

class ChessState extends Equatable{
  const ChessState({
    this.status = ChessStatus.initial,
    this.chess,
    this.tiles = const <List<ChessModel?>>[],
    this.whitePieces = const <ChessModel>[],
    this.blackPieces = const <ChessModel>[],
    this.tilesOn = const <List<int>>[],
    this.respawnedPosition = const <int>[],
    this.isPlayerTurn = true,
    this.isGameOver = false,
  });

  final ChessStatus status;
  final ChessModel? chess;
  final List<List<ChessModel?>> tiles;
  final List<ChessModel> whitePieces;
  final List<ChessModel> blackPieces;
  final List<List<int>> tilesOn;
  final List<int> respawnedPosition;
  final bool isPlayerTurn;
  final bool isGameOver;

  @override
  List<Object?> get props => [status, chess, tiles, whitePieces, blackPieces, tilesOn, respawnedPosition, isPlayerTurn, isGameOver];

  ChessState copyWith({
    ChessStatus? status,
    ValueGetter<ChessModel?>? chess,
    List<List<ChessModel?>>? tiles,
    List<ChessModel>? whitePieces,
    List<ChessModel>? blackPieces,
    List<List<int>>? tilesOn,
    List<int>? respawnedPosition,
    bool? isPlayerTurn,
    bool? isGameOver,
  }) {
    return ChessState(
      status: status ?? this.status,
      chess: chess != null ? chess() : this.chess,
      tiles: tiles ?? this.tiles,
      whitePieces: whitePieces ?? this.whitePieces,
      blackPieces: blackPieces ?? this.blackPieces,
      tilesOn: tilesOn ?? this.tilesOn,
      respawnedPosition: respawnedPosition ?? this.respawnedPosition,
      isPlayerTurn: isPlayerTurn ?? this.isPlayerTurn,
      isGameOver: isGameOver ?? this.isGameOver
    );
  }
}