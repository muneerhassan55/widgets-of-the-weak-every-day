import 'package:flutter/material.dart';
import 'package:widget_of_the_weak/screens/audio_recorder_and_play.dart';
import 'package:widget_of_the_weak/screens/bottom_model_sheet.dart';

import 'screens/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AudioRecorderAndPlay()
        //UrlLauncher()
        //const BottomModelSheet()
        );
  }
}
