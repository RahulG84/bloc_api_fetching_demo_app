import 'package:api_call_using_bloc_pattern/features/posts/ui/posts_page.dart';
import 'package:flutter/material.dart';

import 'features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostPage(),
    );
  }
}