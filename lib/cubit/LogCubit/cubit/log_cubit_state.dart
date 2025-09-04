part of 'log_cubit_cubit.dart';

abstract class LogCubitState extends Equatable {
  const LogCubitState();

  @override
  List<Object?> get props => [];
}

class LogCubitInitial extends LogCubitState {}

class LogCubitLoading extends LogCubitState {}

class LogCubitSuccess extends LogCubitState {
  final String message;
  const LogCubitSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class LogCubitFailure extends LogCubitState {
  final String message;
  const LogCubitFailure(this.message);

  @override
  List<Object?> get props => [message];
}
