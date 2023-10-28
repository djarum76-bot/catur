part of 'chess_bloc.dart';

abstract class ChessEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class ChessInitial extends ChessEvent{}

class ChessTapped extends ChessEvent{
  final List<int> position;
  final ChessModel chess;

  ChessTapped(this.position, this.chess);
}

class ChessMoved extends ChessEvent{
  final List<int> position;

  ChessMoved(this.position);
}

class ChessRespawned extends ChessEvent{
  final ChessModel chess;

  ChessRespawned(this.chess);
}