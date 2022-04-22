abstract class GenericState {}

class InitializeState implements GenericState {}

class LoadingState implements GenericState {}

class LoadedListState<T> implements GenericState {
  final List<T> data;

  LoadedListState({required this.data});
}

class LoadedState<T> implements GenericState {
  final T data;

  LoadedState({required this.data});
}

class ErrorState implements GenericState {
  String error;

  ErrorState({required this.error});
}
