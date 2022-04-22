abstract class GenericEvent {}

class InitializeEvent<T> implements GenericEvent {
  InitializeEvent();
}

class RefreshEvent<T> implements GenericEvent {
  RefreshEvent();
}
