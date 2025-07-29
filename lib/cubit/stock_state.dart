part of 'stock_cubit.dart';

@immutable
sealed class StockState {}

final class StockInitial extends StockState {}

final class StockLoaded extends StockState {
  final List<Model> list;

  StockLoaded(this.list);
}

final class StockError extends StockState {
  final String message;

  StockError(this.message);
}

final class StockLoading extends StockState {}
