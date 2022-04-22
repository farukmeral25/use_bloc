import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_bloc/core/usecase/usecase.dart';
import 'package:use_bloc/core/viewmodel/generic_event.dart';
import 'package:use_bloc/core/viewmodel/generic_state.dart';
import 'package:use_bloc/feature/home/domain/entity/post.dart';
import 'package:use_bloc/feature/home/domain/usecase/fetch_post_usecase.dart';

class PostBloc extends Bloc<GenericEvent, GenericState> {
  final FetchPostUsecase fetchPostUsecase;
  PostBloc(GenericState initialState, this.fetchPostUsecase)
      : super(initialState) {
    on<GenericEvent>((event, emit) async {
      if (event is InitializeEvent) {
        emit(InitializeState());
        emit(LoadingState());
        try {
          final fetchPostEither = await fetchPostUsecase(NoParams());
          return fetchPostEither.fold((failure) {
            emit(ErrorState(error: failure.toString()));
          }, ((data) {
            emit(LoadedListState<Post>(data: data));
          }));
        } catch (failure) {
          emit(ErrorState(error: failure.toString()));
        }
      } else if (event is RefreshEvent) {}
    });
  }
}
