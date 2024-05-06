import 'package:flutter/material.dart';
import 'package:reelstok/domain/entities/videos_post.dart';
import '../../infraestructura/models/local_video_model.dart';
import '../../shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier[

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async{

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map(
      (video) => VideoModel.fromJson(video).toVideoPostEntity()).toList(); 
  
  videos.addAll(newVideos);
  initialLoading = false;
  notifyListeners();
  }
  
]
