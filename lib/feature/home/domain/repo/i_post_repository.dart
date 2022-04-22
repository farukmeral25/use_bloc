import 'package:dartz/dartz.dart';
import 'package:use_bloc/core/error/failure.dart';
import 'package:use_bloc/feature/home/domain/entity/post.dart';

abstract class IPostRepository {
  Future<Either<Failure, List<Post>>> fetchPosts();
}
