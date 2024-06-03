import 'package:flutter/material.dart';
import 'package:reelstok/presentation/widgets/shared/video_buttons.dart';
import 'package:reelstok/presentation/widgets/video/fullscreen_player.dart';

import '../../../domain/entities/videos_post.dart';

class VideoScrollableView extends StatelessWidget{

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
    Widget build(BuildContext context) {
      // Permite hacer scroll a pantalla completa
      // con un listado, aunque este mejora la carga
      // a lo necesario para no ocupar mucha memoria
      return PageView.builder(
        scrollDirection: Axis.vertical,
        // Para Android
        physics: const BouncingScrollPhysics(),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final VideoPost videoPost = videos[index];
          return Stack(
            children: [
              // Ver el video y gradiente
              SizedBox.expand(
                child: FullScreenPlayer(
                  caption: videoPost.caption,
                  videoUrl: videoPost.videoUrl,
                ),
              ),
              // Para cambiar la posición por defecto del botón
              Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons(video: videoPost),
              ),
            ],
          );
        },
      );
    }
  }