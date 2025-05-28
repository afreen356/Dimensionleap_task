import 'package:flutter/material.dart';
import 'package:flutter_post_app/src/application/providers/post_provider.dart';
import 'package:flutter_post_app/src/domain/services/api_service.dart';
import 'package:flutter_post_app/src/presentation/view/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      Provider(create: (_)=> ApiService()),
      ChangeNotifierProvider(create: (context)=>PostProvider(apiService:Provider.of<ApiService>(context,listen: false) ))
    ],
   child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Post App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen()
    );
  }
}

