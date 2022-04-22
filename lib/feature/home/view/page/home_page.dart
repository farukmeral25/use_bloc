import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_bloc/core/viewmodel/generic_event.dart';
import 'package:use_bloc/core/viewmodel/generic_state.dart';
import 'package:use_bloc/feature/home/data/repo_impl/post_repository.dart';
import 'package:use_bloc/feature/home/domain/entity/post.dart';
import 'package:use_bloc/feature/home/domain/usecase/fetch_post_usecase.dart';
import 'package:use_bloc/feature/home/viewmodel/post_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(
        InitializeState(),
        FetchPostUsecase(postRepository: PostRepository()),
      )..add(
          InitializeEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PostBloc, GenericState>(
          builder: (context, state) {
            if (state is InitializeState) {
              return const SizedBox.shrink();
            }
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is LoadedListState<Post>) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.data[index].title),
                    subtitle: Text(state.data[index].thumbnail),
                    leading: SizedBox(
                      width: 100,
                      child: Text(state.data[index].authorFullname),
                    ),
                  );
                },
                itemCount: state.data.length,
              );
            }
            if (state is ErrorState) {
              return Center(child: Text(state.error));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
