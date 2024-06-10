import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reelstok/config/theme/app_theme.dart';
import 'package:reelstok/domain/repositories/video_posts_repository.dart';
import 'package:reelstok/infraestructura/datasources/local_video_datasource_impl.dart';
import 'package:reelstok/infraestructura/repositories/video_posts_repository_impl.dart';
import 'package:reelstok/presentation/providers/discover_provider.dart';
import 'package:reelstok/presentation/screen/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsRepositoryImpl = VideoPostsRepositoryImpl(videoPostsDatasource: LocalVideoDatasourceImpl());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_)=> DiscoverProvider(videoPostsRepository: videoPostsRepositoryImpl))
      ],
      child: MaterialApp(
        title: 'Reelstok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
        ),
    );
  }
}