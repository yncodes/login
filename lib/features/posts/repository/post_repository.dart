import 'package:login/features/posts/posts_model/PostsModel.dart';

abstract class PostRepository{
  Future<PostsModel> getPost();
}