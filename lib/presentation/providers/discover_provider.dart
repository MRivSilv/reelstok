import 'package:flutter/material.dart';
import 'package:reelstok/domain/entities/videos_post.dart';
import 'package:reelstok/domain/repositories/video_posts_repository.dart';
import '../../infraestructura/models/local_video_model.dart';
import '../../shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostsRepository videoPostsRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostsRepository});

  Future<void> loadNextPage() async{

    await Future.delayed(const Duration(seconds: 2));

    /*
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => VideoModel.fromJson(video).toVideoPostEntity()).toList(); 
    */
    final newVideos = await videoPostsRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
  
}
