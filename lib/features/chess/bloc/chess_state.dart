part of 'chess_bloc.dart';

enum ChessStatus { initial, progressed, finished }

class ChessState extends Equatable{
  const ChessState({
    this.status = ChessStatus.initial,
    this.chess,
    this.tiles = const <ChessModel?>[],
    this.tilesOn = const <int>[],
    this.isPlayerTurn = true
  });

  final ChessStatus status;
  final ChessModel? chess;
  final List<ChessModel?> tiles;
  final List<int> tilesOn;
  final bool isPlayerTurn;

  @override
  List<Object?> get props => [status, chess, tiles, tilesOn, isPlayerTurn];

  ChessState copyWith({
    ChessStatus? status,
    ChessModel? chess,
    List<ChessModel?>? tiles,
    List<int>? tilesOn,
    bool? isPlayerTurn
  }) {
    return ChessState(
      status: status ?? this.status,
      chess: chess ?? this.chess,
      tiles: tiles ?? this.tiles,
      tilesOn: tilesOn ?? this.tilesOn,
      isPlayerTurn: isPlayerTurn ?? this.isPlayerTurn
    );
  }
}