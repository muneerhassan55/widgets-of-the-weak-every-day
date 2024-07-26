import 'package:flutter/material.dart';

class UrlLauncher extends StatefulWidget {
  const UrlLauncher({super.key});

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Url Launcher"),
      ),
    );
  }
}
