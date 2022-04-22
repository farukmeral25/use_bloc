import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:use_bloc/core/constants/domain_resource_enum.dart';
import 'package:use_bloc/core/constants/main_endpoint.dart';
import 'package:use_bloc/core/error/failure.dart';
import 'package:use_bloc/feature/home/data/model/post_model.dart';
import 'package:use_bloc/feature/home/domain/entity/post.dart';
import 'package:use_bloc/feature/home/domain/repo/i_post_repository.dart';
import 'package:http/http.dart' as http;

class PostRepository implements IPostRepository {
  @override
  Future<Either<Failure, List<Post>>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(
          DomainResourceEnum.reddit.getUrlByState() +
              MainEndpoints.fetchPost.stateToEndpoint()));

      var jsonData = jsonDecode(response.body);
      List<Post> posts = [];
      for (var item in jsonData['data']['children']) {
        Post post = PostModel.fromMap(item);
        posts.add(post);
      }

      return Right(posts);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
