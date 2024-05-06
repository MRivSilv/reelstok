import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reelstok/config/theme/app_theme.dart';
import 'package:reelstok/presentation/providers/discover_provider.dart';
import 'package:reelstok/presentation/screen/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_)=> DiscoverProvider())
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