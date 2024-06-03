import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reelstok/presentation/providers/discover_provider.dart';
import 'package:reelstok/presentation/widgets/shared/video_scrollable_view.dart';


class DiscoverScreen extends StatelessWidget{
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Va a estar atento a nuevos videos
    final discoverProvider = context.watch<DiscoverProvider>();

    // Alternativa más antigua
    // final otroProvider = Provider.of<DiscoverProvider>(context, listen: false);
  return Scaffold(
    body: discoverProvider.initialLoading
      ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
      : VideoScrollableView(videos: discoverProvider.videos),
  ); // Scaffold
  }
}