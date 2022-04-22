import 'package:dartz/dartz.dart';

import 'package:use_bloc/core/error/failure.dart';
import 'package:use_bloc/core/usecase/usecase.dart';
import 'package:use_bloc/feature/home/domain/entity/post.dart';
import 'package:use_bloc/feature/home/domain/repo/i_post_repository.dart';

class FetchPostUsecase implements Usecase<List<Post>, NoParams> {
  IPostRepository postRepository;

  FetchPostUsecase({required this.postRepository});

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await postRepository.fetchPosts();
  }
}
